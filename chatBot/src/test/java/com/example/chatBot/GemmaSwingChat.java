package com.example.chatBot;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.time.Duration;

// JSON 파싱을 위한 라이브러리 추가
import org.json.JSONException;
import org.json.JSONObject;

public class GemmaSwingChat extends JFrame {
	private static final String SERVER_URL = "http://localhost:1234/v1/chat/completions";
	private static final String SYSTEM_PROMPT = "You are **Gemma-1B**, a compact large-language-model.\\n목표: 사용자에게 정확하고 유익하며 친절한 한국어 답변을 제공한다.\\n\\nGeneral guidelines\\n1. Truthfulness first – fact-check internally, cite sources if asked.\\n2. Clarity & brevity – 핵심을 먼저, 필요하면 세부 정보를 단계적으로 추가.\\n3. Polite & supportive – 존중하는 어조 유지, 비난·편견·차별 금지.\\n4. Code requests\\n   • 기본적으로 Python 예시를 제안하되, 다른 언어를 요구하면 해당 언어로.\\n   • 주석을 달아 가독성을 높이고, 실행 방법을 간단히 안내.\\n6. Reason step-by-step for complex questions, but hide chain-of-thought; present only the final, clear reasoning.\\n7. Refuse or safe-complete any request that violates privacy, ethics, or local laws.\\n8. Answers default to Korean; switch to English (or other) if the user writes in that language or explicitly asks.\\n\\nFormatting\\n- Use Markdown for structure (titles ##, lists, code blocks).\\n- 긴 설명은 단락으로 3줄 요약을 달아준다.\\n- 표는 정보 전달이 확실히 도움이 될 때만 사용.\\n\\nAbove all, behave like a knowledgeable, concise senior engineer-teacher who genuinely wants the user to succeed.";

	private JTextArea chatArea;
	private JTextField messageField;
	private JButton sendButton;
	private JPanel statusPanel;
	private JLabel statusLabel;
	private JScrollPane scrollPane;
	private HttpClient httpClient;
	private boolean isProcessing = false;

	// 이스케이프 시퀀스 처리를 위한 변수
	private boolean lastCharWasBackslash = false;
	private StringBuilder pendingEscapeSequence = new StringBuilder();

	public GemmaSwingChat() {
		// UI 초기화
		initializeUI();

		// HTTP 클라이언트 초기화
		httpClient = HttpClient.newBuilder().version(HttpClient.Version.HTTP_1_1).connectTimeout(Duration.ofSeconds(10))
				.build();

		// 시작 메시지 표시
		appendToChatArea("Gemma 챗봇에 오신 것을 환영합니다!\n질문을 입력하고 엔터키를 누르거나 전송 버튼을 클릭하세요.\n\n", Color.BLUE);
	}

	private void initializeUI() {
		// 프레임 설정
		setTitle("Gemma 챗봇");
		setSize(600, 700);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLocationRelativeTo(null);

		// 한글 폰트 설정
		Font koreanFont = new Font("Malgun Gothic", Font.PLAIN, 14);

		// 채팅 영역 설정
		chatArea = new JTextArea();
		chatArea.setEditable(false);
		chatArea.setFont(koreanFont);
		chatArea.setLineWrap(true);
		chatArea.setWrapStyleWord(true);
		chatArea.setBorder(new EmptyBorder(10, 10, 10, 10));

		// 스크롤 패널 설정
		scrollPane = new JScrollPane(chatArea);
		scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);

		// 메시지 입력 필드 설정
		messageField = new JTextField();
		messageField.setFont(koreanFont);
		messageField.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				sendMessage();
			}
		});

		// 전송 버튼 설정
		sendButton = new JButton("전송");
		sendButton.setFont(koreanFont);
		sendButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				sendMessage();
			}
		});

		// 상태 패널 설정
		statusPanel = new JPanel(new BorderLayout());
		statusPanel.setBorder(new EmptyBorder(5, 10, 5, 10));
		statusLabel = new JLabel("대기 중...");
		statusLabel.setFont(new Font("Malgun Gothic", Font.PLAIN, 12));
		statusPanel.add(statusLabel, BorderLayout.WEST);

		// 입력 패널 설정
		JPanel inputPanel = new JPanel(new BorderLayout());
		inputPanel.add(messageField, BorderLayout.CENTER);
		inputPanel.add(sendButton, BorderLayout.EAST);
		inputPanel.setBorder(new EmptyBorder(10, 10, 10, 10));

		// 레이아웃 설정
		setLayout(new BorderLayout());
		add(scrollPane, BorderLayout.CENTER);
		add(inputPanel, BorderLayout.SOUTH);
		add(statusPanel, BorderLayout.NORTH);
	}

	private void sendMessage() {
		// 처리 중이면 중복 요청 방지
		if (isProcessing) {
			return;
		}

		String message = messageField.getText().trim();
		if (message.isEmpty()) {
			return;
		}

		// 사용자 메시지 표시
		appendToChatArea("사용자: " + message + "\n", new Color(0, 100, 0));

		// 입력 필드 초기화
		messageField.setText("");

		// 봇 응답 시작 표시
		appendToChatArea("Bot: ", new Color(70, 30, 180));

		// 상태 업데이트
		updateStatus("응답 생성 중...", true);

		// 별도 스레드에서 API 호출
		new Thread(() -> {
			try {
				sendMessageToAPI(message);
				updateStatus("대기 중...", false);
			} catch (Exception e) {
				appendToChatArea("\n[오류 발생: " + e.getMessage() + "]\n", Color.RED);
				updateStatus("오류 발생", false);
				e.printStackTrace();
			}
		}).start();
	}

	private void sendMessageToAPI(String message) {
		try {
			// API 요청 JSON 생성
			String requestBody = createRequestJSON(message);

			// HTTP 요청 생성
			HttpRequest request = HttpRequest.newBuilder().uri(URI.create(SERVER_URL))
					.header("Content-Type", "application/json").POST(HttpRequest.BodyPublishers.ofString(requestBody))
					.build();

			// 요청 전송 및 스트림 응답 수신
			HttpResponse<InputStream> response = httpClient.send(request, HttpResponse.BodyHandlers.ofInputStream());

			// 상태 코드 확인
			if (response.statusCode() != 200) {
				SwingUtilities.invokeLater(() -> {
					appendToChatArea("\n[HTTP 오류: " + response.statusCode() + "]\n", Color.RED);
				});
				return;
			}

			// 응답 스트림 읽기
			processResponseStream(response.body());

		} catch (Exception e) {
			SwingUtilities.invokeLater(() -> {
				appendToChatArea("\n[오류 발생: " + e.getMessage() + "]\n", Color.RED);
			});
			e.printStackTrace();
		}
	}

	private String createRequestJSON(String userMessage) {
		// 이스케이프 처리를 위한 준비
		String escapedSystemPrompt = SYSTEM_PROMPT.replace("\\", "\\\\").replace("\"", "\\\"");
		String escapedUserMessage = userMessage.replace("\\", "\\\\").replace("\"", "\\\"");

		return String.format("""
				{
				    "model": "gemma-3-1b-it",
				    "messages": [
				        {
				            "role": "system",
				            "content": "%s"
				        },
				        {
				            "role": "user",
				            "content": "%s"
				        }
				    ],
				    "response_format": {
				        "type": "json_schema",
				        "json_schema": {
				            "name": "answer_response",
				            "strict": "true",
				            "schema": {
				                "type": "object",
				                "properties": {
				                    "answer": {
				                        "type": "string"
				                    }
				                },
				                "required": [
				                    "answer"
				                ]
				            }
				        }
				    },
				    "temperature": 0.7,
				    "max_tokens": 4096,
				    "stream": true
				}
				""", escapedSystemPrompt, escapedUserMessage);
	}

	private void processResponseStream(InputStream responseStream) throws IOException {
		// 응답 스트림을 읽기 위한 BufferedReader 생성
		BufferedReader reader = new BufferedReader(new InputStreamReader(responseStream, StandardCharsets.UTF_8));

		String line;

		// 시작 시 이스케이프 처리 변수 초기화
		lastCharWasBackslash = false;
		pendingEscapeSequence.setLength(0);

		// 스트림에서 한 줄씩 읽기
		while ((line = reader.readLine()) != null) {
			// 빈 줄은 건너뛰기
			if (line.isEmpty()) {
				continue;
			}

			// 스트림 완료 메시지 확인
			if (line.equals("data: [DONE]")) {
				// 처리되지 않은 이스케이프 시퀀스가 있다면 처리
				if (pendingEscapeSequence.length() > 0) {
					final String remaining = pendingEscapeSequence.toString();
					SwingUtilities.invokeLater(() -> {
						appendToChatArea(remaining, new Color(70, 30, 180), false);
					});
				}
				break;
			}

			// "data: " 접두사 확인
			if (line.startsWith("data: ")) {
				// 데이터 부분만 추출
				String jsonData = line.substring(6);

				try {
					// JSON 파싱
					JSONObject jsonObject = new JSONObject(jsonData);

					// choices 배열 확인
					if (jsonObject.has("choices") && jsonObject.getJSONArray("choices").length() > 0) {
						JSONObject choiceObj = jsonObject.getJSONArray("choices").getJSONObject(0);

						// delta 객체에서 content 추출
						if (choiceObj.has("delta") && choiceObj.getJSONObject("delta").has("content")) {
							String contentValue = choiceObj.getJSONObject("delta").getString("content");

							// 빈 콘텐츠는 무시
							if (contentValue.isEmpty()) {
								continue;
							}

							// 이스케이프 시퀀스 처리
							processContentWithEscapeSequences(contentValue);
						}
					}
				} catch (JSONException e) {
					// JSON 파싱 오류 (스트리밍 중 일부 토큰에서 발생할 수 있음)
					System.err.println("JSON 파싱 오류: " + e.getMessage());
				}
			}
		}

		// 응답 완료 후 줄바꿈
		SwingUtilities.invokeLater(() -> {
			appendToChatArea("\n\n", null);
		});
	}

	private void processContentWithEscapeSequences(String contentValue) {
		if (contentValue == null || contentValue.isEmpty()) {
			return;
		}

		StringBuilder processedContent = new StringBuilder();

		for (int i = 0; i < contentValue.length(); i++) {
			char currentChar = contentValue.charAt(i);

			// 이전 문자가 백슬래시였다면
			if (lastCharWasBackslash) {
				pendingEscapeSequence.append(currentChar);

				// 알려진 이스케이프 시퀀스인지 확인
				if (currentChar == 'n') {
					// 줄바꿈 처리
					processedContent.append('\n');
					lastCharWasBackslash = false;
					pendingEscapeSequence.setLength(0);
				} else if (currentChar == 't') {
					// 탭 처리
					processedContent.append('\t');
					lastCharWasBackslash = false;
					pendingEscapeSequence.setLength(0);
				} else if (currentChar == '"') {
					// 따옴표 처리
					processedContent.append('"');
					lastCharWasBackslash = false;
					pendingEscapeSequence.setLength(0);
				} else if (currentChar == '\\') {
					// 백슬래시 처리
					processedContent.append('\\');
					lastCharWasBackslash = false;
					pendingEscapeSequence.setLength(0);
				} else if (currentChar == 'r') {
					// 캐리지 리턴은 무시
					lastCharWasBackslash = false;
					pendingEscapeSequence.setLength(0);
				} else {
					// 알 수 없는 이스케이프 시퀀스면 그대로 출력
					processedContent.append('\\').append(currentChar);
					lastCharWasBackslash = false;
					pendingEscapeSequence.setLength(0);
				}
			} else if (currentChar == '\\') {
				// 백슬래시가 나타나면 플래그 설정하고 대기
				lastCharWasBackslash = true;
				pendingEscapeSequence.setLength(0);
				pendingEscapeSequence.append('\\');
			} else {
				// 일반 문자는 그대로 추가
				processedContent.append(currentChar);
			}
		}

		// 처리된 내용이 있으면 화면에 표시
		if (processedContent.length() > 0) {
			final String finalContent = processedContent.toString();
			SwingUtilities.invokeLater(() -> {
				appendToChatArea(finalContent, new Color(70, 30, 180), false);
			});
		}

		// 만약 문자열이 백슬래시로 끝나면, 다음 토큰을 기다리는 상태로 둠
		// lastCharWasBackslash는 이미 설정되어 있음
	}

	// 텍스트에서 JSON 객체를 추출하는 메서드
	private String extractJsonFromText(String text) {
		int openBraceIndex = text.indexOf('{');
		if (openBraceIndex == -1) {
			return null;
		}

		int closeBraceIndex = text.lastIndexOf('}');
		if (closeBraceIndex <= openBraceIndex) {
			return null;
		}

		return text.substring(openBraceIndex, closeBraceIndex + 1);
	}

	// 완전한 JSON 응답 처리
	private void processCompleteJsonResponse(String response) {
		String jsonStr = extractJsonFromText(response);
		if (jsonStr == null) {
			return;
		}

		try {
			JSONObject json = new JSONObject(jsonStr);
			if (json.has("answer")) {
				String answer = json.getString("answer");
				// 줄바꿈 문자 처리
				String processedAnswer = answer.replace("\\n", "\n").replace("\\t", "\t").replace("\\\"", "\"")
						.replace("\\\\", "\\");

				// UI 스레드에서 텍스트 영역에 콘텐츠 추가
				SwingUtilities.invokeLater(() -> {
					// 기존 내용 모두 지우고 새로 표시
					chatArea.setText("");
					appendToChatArea("사용자: " + messageField.getText().trim() + "\n", new Color(0, 100, 0));
					appendToChatArea("Bot: ", new Color(70, 30, 180));
					appendToChatArea(processedAnswer, new Color(70, 30, 180), true);
				});
			}
		} catch (JSONException e) {
			System.err.println("최종 JSON 파싱 오류: " + e.getMessage());
		}
	}

	private void appendToChatArea(String text, Color color) {
		appendToChatArea(text, color, true);
	}

	private void appendToChatArea(String text, Color color, boolean scrollToBottom) {
		// 원래 색상 저장
		Color originalColor = chatArea.getForeground();

		// 색상 변경 (색상이 제공된 경우)
		if (color != null) {
			chatArea.setForeground(color);
		}

		// 텍스트 추가
		chatArea.append(text);

		// 원래 색상으로 복원
		if (color != null) {
			chatArea.setForeground(originalColor);
		}

		// 스크롤을 맨 아래로 이동 (필요한 경우)
		if (scrollToBottom) {
			chatArea.setCaretPosition(chatArea.getDocument().getLength());
		}
	}

	private void updateStatus(String status, boolean processing) {
		SwingUtilities.invokeLater(() -> {
			statusLabel.setText(status);
			isProcessing = processing;
			messageField.setEnabled(!processing);
			sendButton.setEnabled(!processing);
		});
	}

	public static void main(String[] args) {
		// UI 스레드에서 실행
		SwingUtilities.invokeLater(() -> {
			try {
				// Nimbus 룩앤필 설정
				UIManager.setLookAndFeel("javax.swing.plaf.nimbus.NimbusLookAndFeel");
			} catch (Exception e) {
				// 기본 룩앤필 사용
			}

			// UTF-8 인코딩 설정
			System.setProperty("file.encoding", "UTF-8");

			// 프레임 표시
			new GemmaSwingChat().setVisible(true);
		});
	}
}