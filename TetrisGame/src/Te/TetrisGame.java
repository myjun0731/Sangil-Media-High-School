package Te;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.util.ArrayList;
import java.util.Random;

public class TetrisGame extends JFrame implements ActionListener {
	private static final int BOARD_WIDTH = 10;
	private static final int BOARD_HEIGHT = 20;
	private static final int BLOCK_SIZE = 30;
	private static final int GAME_SPEED = 600;
	private static final int NEXT_BLOCK_SIZE = 20;

	private Timer timer;
	private boolean gameRunning = false;
	private boolean gamePaused = false;
	private int score = 0;
	private int lines = 0;
	private int level = 1;
	private int tetrisCount = 0;

	private int[][] board = new int[BOARD_HEIGHT][BOARD_WIDTH];
	private Tetromino currentPiece;
	private Tetromino nextPiece;
	private Random random = new Random();

	private JPanel gamePanel;
	private JPanel infoPanel;
	private JPanel nextPiecePanel;
	private JLabel scoreLabel;
	private JLabel linesLabel;
	private JLabel levelLabel;
	private JLabel tetrisLabel;
	private JLabel nextPieceLabel;
	private JLabel statusLabel;

	public TetrisGame() {
		initializeGame();
		setupUI();
		startNewGame();
	}

	private void initializeGame() {
		setTitle("테트리스");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setResizable(false);

		timer = new Timer(GAME_SPEED, this);

		addKeyListener(new TetrisKeyListener());
		setFocusable(true);
		setFocusTraversalKeysEnabled(false);
	}

	private void setupUI() {
		setLayout(new BorderLayout());

		// 게임 패널
		gamePanel = new JPanel() {
			@Override
			protected void paintComponent(Graphics g) {
				super.paintComponent(g);
				drawGame(g);
			}
		};
		gamePanel.setPreferredSize(new Dimension(BOARD_WIDTH * BLOCK_SIZE + 2, BOARD_HEIGHT * BLOCK_SIZE + 2));
		gamePanel.setBackground(Color.BLACK);
		gamePanel.setBorder(BorderFactory.createLineBorder(Color.WHITE, 2));

		// 정보 패널
		infoPanel = new JPanel();
		infoPanel.setLayout(new BoxLayout(infoPanel, BoxLayout.Y_AXIS));
		infoPanel.setPreferredSize(new Dimension(220, 600));
		infoPanel.setBackground(Color.DARK_GRAY);
		infoPanel.setBorder(BorderFactory.createLineBorder(Color.GRAY, 1));

		setupInfoPanel();

		add(gamePanel, BorderLayout.CENTER);
		add(infoPanel, BorderLayout.EAST);

		pack();
		setLocationRelativeTo(null);
	}

	private void setupInfoPanel() {
		infoPanel.add(Box.createVerticalStrut(15));

		// 게임 상태
		statusLabel = new JLabel("게임 진행 중", SwingConstants.CENTER);
		statusLabel.setForeground(Color.GREEN);
		statusLabel.setFont(new Font("Malgun Gothic", Font.BOLD, 14));
		statusLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
		infoPanel.add(statusLabel);

		infoPanel.add(Box.createVerticalStrut(20));

		// 점수 정보
		scoreLabel = new JLabel("점수: 0", SwingConstants.CENTER);
		scoreLabel.setForeground(Color.WHITE);
		scoreLabel.setFont(new Font("Malgun Gothic", Font.BOLD, 16));
		scoreLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
		infoPanel.add(scoreLabel);

		infoPanel.add(Box.createVerticalStrut(10));

		linesLabel = new JLabel("라인: 0", SwingConstants.CENTER);
		linesLabel.setForeground(Color.WHITE);
		linesLabel.setFont(new Font("Malgun Gothic", Font.BOLD, 16));
		linesLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
		infoPanel.add(linesLabel);

		infoPanel.add(Box.createVerticalStrut(10));

		levelLabel = new JLabel("레벨: 1", SwingConstants.CENTER);
		levelLabel.setForeground(Color.WHITE);
		levelLabel.setFont(new Font("Malgun Gothic", Font.BOLD, 16));
		levelLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
		infoPanel.add(levelLabel);

		infoPanel.add(Box.createVerticalStrut(10));

		tetrisLabel = new JLabel("테트리스: 0", SwingConstants.CENTER);
		tetrisLabel.setForeground(Color.YELLOW);
		tetrisLabel.setFont(new Font("Malgun Gothic", Font.BOLD, 14));
		tetrisLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
		infoPanel.add(tetrisLabel);

		infoPanel.add(Box.createVerticalStrut(25));

		// 다음 블록
		nextPieceLabel = new JLabel("다음 블록:", SwingConstants.CENTER);
		nextPieceLabel.setForeground(Color.WHITE);
		nextPieceLabel.setFont(new Font("Malgun Gothic", Font.BOLD, 14));
		nextPieceLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
		infoPanel.add(nextPieceLabel);

		infoPanel.add(Box.createVerticalStrut(10));

		// 다음 블록 표시 패널
		nextPiecePanel = new JPanel() {
			@Override
			protected void paintComponent(Graphics g) {
				super.paintComponent(g);
				drawNextPiece(g);
			}
		};
		nextPiecePanel.setPreferredSize(new Dimension(100, 80));
		nextPiecePanel.setMaximumSize(new Dimension(100, 80));
		nextPiecePanel.setBackground(Color.BLACK);
		nextPiecePanel.setBorder(BorderFactory.createLineBorder(Color.WHITE, 1));
		nextPiecePanel.setAlignmentX(Component.CENTER_ALIGNMENT);
		infoPanel.add(nextPiecePanel);

		infoPanel.add(Box.createVerticalStrut(30));

		// 조작법
		JPanel controlsPanel = new JPanel();
		controlsPanel.setLayout(new BoxLayout(controlsPanel, BoxLayout.Y_AXIS));
		controlsPanel.setBackground(Color.DARK_GRAY);
		controlsPanel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createLineBorder(Color.GRAY), "조작법", 0,
				0, new Font("Malgun Gothic", Font.BOLD, 12), Color.WHITE));

		String[] controls = { "←→: 이동", "↓: 빠른 낙하", "↑: 회전", "스페이스: 일시정지", "Enter: 재시작" };

		for (String control : controls) {
			JLabel controlLabel = new JLabel(control, SwingConstants.CENTER);
			controlLabel.setForeground(Color.LIGHT_GRAY);
			controlLabel.setFont(new Font("Malgun Gothic", Font.PLAIN, 11));
			controlLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
			controlsPanel.add(controlLabel);
			controlsPanel.add(Box.createVerticalStrut(3));
		}

		infoPanel.add(controlsPanel);

		infoPanel.add(Box.createVerticalStrut(20));

		// 점수 시스템 설명
		JPanel scoreSystemPanel = new JPanel();
		scoreSystemPanel.setLayout(new BoxLayout(scoreSystemPanel, BoxLayout.Y_AXIS));
		scoreSystemPanel.setBackground(Color.DARK_GRAY);
		scoreSystemPanel.setBorder(BorderFactory.createTitledBorder(BorderFactory.createLineBorder(Color.GRAY),
				"점수 시스템", 0, 0, new Font("Malgun Gothic", Font.BOLD, 12), Color.WHITE));

		String[] scoreInfo = { "1줄: 40 × 레벨", "2줄: 100 × 레벨", "3줄: 300 × 레벨", "4줄: 1200 × 레벨", "(테트리스 보너스!)" };

		for (int i = 0; i < scoreInfo.length; i++) {
			JLabel scoreInfoLabel = new JLabel(scoreInfo[i], SwingConstants.CENTER);
			if (i == scoreInfo.length - 1) {
				scoreInfoLabel.setForeground(Color.YELLOW);
				scoreInfoLabel.setFont(new Font("Malgun Gothic", Font.BOLD, 10));
			} else {
				scoreInfoLabel.setForeground(Color.LIGHT_GRAY);
				scoreInfoLabel.setFont(new Font("Malgun Gothic", Font.PLAIN, 10));
			}
			scoreInfoLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
			scoreSystemPanel.add(scoreInfoLabel);
			if (i < scoreInfo.length - 1) {
				scoreSystemPanel.add(Box.createVerticalStrut(2));
			}
		}

		infoPanel.add(scoreSystemPanel);
	}

	private void drawNextPiece(Graphics g) {
		if (nextPiece == null)
			return;

		Graphics2D g2d = (Graphics2D) g;
		g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

		// 패널 중앙에 블록 표시
		int panelWidth = nextPiecePanel.getWidth();
		int panelHeight = nextPiecePanel.getHeight();

		// 다음 블록을 0,0 위치에 임시로 만들어서 표시
		Tetromino displayPiece = new Tetromino(nextPiece.type, 0, 0);
		Point[] blocks = displayPiece.getBlocks();

		// 블록들의 경계 계산
		int minX = Integer.MAX_VALUE, maxX = Integer.MIN_VALUE;
		int minY = Integer.MAX_VALUE, maxY = Integer.MIN_VALUE;

		for (Point p : blocks) {
			minX = Math.min(minX, p.x);
			maxX = Math.max(maxX, p.x);
			minY = Math.min(minY, p.y);
			maxY = Math.max(maxY, p.y);
		}

		int blockWidth = (maxX - minX + 1) * NEXT_BLOCK_SIZE;
		int blockHeight = (maxY - minY + 1) * NEXT_BLOCK_SIZE;

		int offsetX = (panelWidth - blockWidth) / 2 - minX * NEXT_BLOCK_SIZE;
		int offsetY = (panelHeight - blockHeight) / 2 - minY * NEXT_BLOCK_SIZE;

		g2d.setColor(getTetrominoColor(nextPiece.type + 1));
		for (Point p : blocks) {
			int x = offsetX + p.x * NEXT_BLOCK_SIZE;
			int y = offsetY + p.y * NEXT_BLOCK_SIZE;
			g2d.fillRect(x, y, NEXT_BLOCK_SIZE - 1, NEXT_BLOCK_SIZE - 1);
			g2d.setColor(Color.WHITE);
			g2d.drawRect(x, y, NEXT_BLOCK_SIZE - 1, NEXT_BLOCK_SIZE - 1);
			g2d.setColor(getTetrominoColor(nextPiece.type + 1));
		}
	}

	private void startNewGame() {
		// 보드 초기화
		for (int i = 0; i < BOARD_HEIGHT; i++) {
			for (int j = 0; j < BOARD_WIDTH; j++) {
				board[i][j] = 0;
			}
		}

		score = 0;
		lines = 0;
		level = 1;
		tetrisCount = 0;
		gameRunning = true;
		gamePaused = false;

		currentPiece = getRandomTetromino();
		nextPiece = getRandomTetromino();

		updateLabels();
		timer.setDelay(GAME_SPEED);
		timer.start();
	}

	private Tetromino getRandomTetromino() {
		int type = random.nextInt(7);
		return new Tetromino(type, BOARD_WIDTH / 2 - 1, 0);
	}

	private void drawGame(Graphics g) {
		Graphics2D g2d = (Graphics2D) g;
		g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

		// 격자 그리기 (배경)
		g2d.setColor(new Color(30, 30, 30));
		for (int i = 0; i <= BOARD_HEIGHT; i++) {
			g2d.drawLine(0, i * BLOCK_SIZE, BOARD_WIDTH * BLOCK_SIZE, i * BLOCK_SIZE);
		}
		for (int j = 0; j <= BOARD_WIDTH; j++) {
			g2d.drawLine(j * BLOCK_SIZE, 0, j * BLOCK_SIZE, BOARD_HEIGHT * BLOCK_SIZE);
		}

		// 보드 그리기
		for (int i = 0; i < BOARD_HEIGHT; i++) {
			for (int j = 0; j < BOARD_WIDTH; j++) {
				if (board[i][j] != 0) {
					g2d.setColor(getTetrominoColor(board[i][j]));
					g2d.fillRect(j * BLOCK_SIZE + 1, i * BLOCK_SIZE + 1, BLOCK_SIZE - 1, BLOCK_SIZE - 1);
					g2d.setColor(getDarkerColor(getTetrominoColor(board[i][j])));
					g2d.drawRect(j * BLOCK_SIZE + 1, i * BLOCK_SIZE + 1, BLOCK_SIZE - 1, BLOCK_SIZE - 1);

					// 3D 효과
					g2d.setColor(getBrighterColor(getTetrominoColor(board[i][j])));
					g2d.drawLine(j * BLOCK_SIZE + 1, i * BLOCK_SIZE + 1, j * BLOCK_SIZE + BLOCK_SIZE - 1,
							i * BLOCK_SIZE + 1);
					g2d.drawLine(j * BLOCK_SIZE + 1, i * BLOCK_SIZE + 1, j * BLOCK_SIZE + 1,
							i * BLOCK_SIZE + BLOCK_SIZE - 1);
				}
			}
		}

		// 현재 블록 그리기
		if (currentPiece != null) {
			g2d.setColor(getTetrominoColor(currentPiece.type + 1));
			for (Point p : currentPiece.getBlocks()) {
				if (p.y >= 0 && p.x >= 0 && p.x < BOARD_WIDTH && p.y < BOARD_HEIGHT) {
					g2d.fillRect(p.x * BLOCK_SIZE + 1, p.y * BLOCK_SIZE + 1, BLOCK_SIZE - 1, BLOCK_SIZE - 1);
					g2d.setColor(getDarkerColor(getTetrominoColor(currentPiece.type + 1)));
					g2d.drawRect(p.x * BLOCK_SIZE + 1, p.y * BLOCK_SIZE + 1, BLOCK_SIZE - 1, BLOCK_SIZE - 1);

					// 3D 효과
					g2d.setColor(getBrighterColor(getTetrominoColor(currentPiece.type + 1)));
					g2d.drawLine(p.x * BLOCK_SIZE + 1, p.y * BLOCK_SIZE + 1, p.x * BLOCK_SIZE + BLOCK_SIZE - 1,
							p.y * BLOCK_SIZE + 1);
					g2d.drawLine(p.x * BLOCK_SIZE + 1, p.y * BLOCK_SIZE + 1, p.x * BLOCK_SIZE + 1,
							p.y * BLOCK_SIZE + BLOCK_SIZE - 1);
				}
			}
		}

		// 게임 오버 메시지
		if (!gameRunning) {
			g2d.setColor(new Color(0, 0, 0, 150));
			g2d.fillRect(0, 0, getWidth(), getHeight());
			g2d.setColor(Color.WHITE);
			g2d.setFont(new Font("Malgun Gothic", Font.BOLD, 28));
			FontMetrics fm = g2d.getFontMetrics();
			String gameOverText = "게임 오버!";
			String scoreText = "최종 점수: " + score;
			String restartText = "Enter를 눌러 재시작";

			g2d.drawString(gameOverText, (getWidth() - fm.stringWidth(gameOverText)) / 2, getHeight() / 2 - 40);

			g2d.setFont(new Font("Malgun Gothic", Font.BOLD, 18));
			fm = g2d.getFontMetrics();
			g2d.drawString(scoreText, (getWidth() - fm.stringWidth(scoreText)) / 2, getHeight() / 2);

			g2d.setFont(new Font("Malgun Gothic", Font.PLAIN, 16));
			fm = g2d.getFontMetrics();
			g2d.drawString(restartText, (getWidth() - fm.stringWidth(restartText)) / 2, getHeight() / 2 + 30);
		}

		// 일시정지 메시지
		if (gamePaused) {
			g2d.setColor(new Color(0, 0, 0, 120));
			g2d.fillRect(0, 0, getWidth(), getHeight());
			g2d.setColor(Color.WHITE);
			g2d.setFont(new Font("Malgun Gothic", Font.BOLD, 24));
			FontMetrics fm = g2d.getFontMetrics();
			String pauseText = "일시정지";
			g2d.drawString(pauseText, (getWidth() - fm.stringWidth(pauseText)) / 2, getHeight() / 2);
		}
	}

	private Color getTetrominoColor(int type) {
		switch (type) {
		case 1:
			return new Color(0, 255, 255); // I - 밝은 시아노
		case 2:
			return new Color(255, 255, 0); // O - 노란색
		case 3:
			return new Color(255, 0, 255); // T - 마젠타
		case 4:
			return new Color(0, 255, 0); // S - 초록색
		case 5:
			return new Color(255, 0, 0); // Z - 빨간색
		case 6:
			return new Color(0, 0, 255); // J - 파란색
		case 7:
			return new Color(255, 165, 0); // L - 주황색
		default:
			return Color.WHITE;
		}
	}

	private Color getDarkerColor(Color color) {
		return new Color(Math.max(0, color.getRed() - 50), Math.max(0, color.getGreen() - 50),
				Math.max(0, color.getBlue() - 50));
	}

	private Color getBrighterColor(Color color) {
		return new Color(Math.min(255, color.getRed() + 50), Math.min(255, color.getGreen() + 50),
				Math.min(255, color.getBlue() + 50));
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (gameRunning && !gamePaused) {
			if (canMove(currentPiece, 0, 1)) {
				currentPiece.y++;
			} else {
				placePiece();
				int clearedLines = clearLines();
				if (clearedLines > 0) {
					updateScore(clearedLines);
				}
				currentPiece = nextPiece;
				nextPiece = getRandomTetromino();

				if (!canMove(currentPiece, 0, 0)) {
					gameRunning = false;
					timer.stop();
					statusLabel.setText("게임 오버");
					statusLabel.setForeground(Color.RED);
				}
			}
			gamePanel.repaint();
			nextPiecePanel.repaint();
		}
	}

	private boolean canMove(Tetromino piece, int deltaX, int deltaY) {
		for (Point p : piece.getBlocks()) {
			int newX = p.x + deltaX;
			int newY = p.y + deltaY;

			if (newX < 0 || newX >= BOARD_WIDTH || newY >= BOARD_HEIGHT) {
				return false;
			}
			if (newY >= 0 && board[newY][newX] != 0) {
				return false;
			}
		}
		return true;
	}

	private void placePiece() {
		for (Point p : currentPiece.getBlocks()) {
			if (p.y >= 0 && p.x >= 0 && p.x < BOARD_WIDTH && p.y < BOARD_HEIGHT) {
				board[p.y][p.x] = currentPiece.type + 1;
			}
		}
	}

	private int clearLines() {
		ArrayList<Integer> linesToClear = new ArrayList<>();

		for (int i = BOARD_HEIGHT - 1; i >= 0; i--) {
			boolean fullLine = true;
			for (int j = 0; j < BOARD_WIDTH; j++) {
				if (board[i][j] == 0) {
					fullLine = false;
					break;
				}
			}
			if (fullLine) {
				linesToClear.add(i);
			}
		}

		// 라인 클리어 애니메이션 효과 (간단한 깜빡임)
		if (linesToClear.size() > 0) {
			for (int lineIndex : linesToClear) {
				for (int j = 0; j < BOARD_WIDTH; j++) {
					board[lineIndex][j] = 8; // 특별한 색상으로 표시
				}
			}
			gamePanel.repaint();

			try {
				Thread.sleep(200);
			} catch (InterruptedException ex) {
				Thread.currentThread().interrupt();
			}
		}

		// 실제 라인 제거
		for (int lineIndex : linesToClear) {
			for (int i = lineIndex; i > 0; i--) {
				System.arraycopy(board[i - 1], 0, board[i], 0, BOARD_WIDTH);
			}
			for (int j = 0; j < BOARD_WIDTH; j++) {
				board[0][j] = 0;
			}
		}

		return linesToClear.size();
	}

	private void updateScore(int clearedLines) {
		lines += clearedLines;

		// 테트리스 점수 시스템
		int scoreToAdd = 0;
		switch (clearedLines) {
		case 1:
			scoreToAdd = 40 * level;
			break;
		case 2:
			scoreToAdd = 100 * level;
			break;
		case 3:
			scoreToAdd = 300 * level;
			break;
		case 4:
			scoreToAdd = 1200 * level; // 테트리스!
			tetrisCount++;
			showTetrisMessage();
			break;
		}

		score += scoreToAdd;
		level = lines / 10 + 1;

		// 레벨이 올라갈 때마다 속도 증가
		int newDelay = Math.max(50, GAME_SPEED - (level - 1) * 40);
		timer.setDelay(newDelay);

		updateLabels();
	}

	private void showTetrisMessage() {
		// 테트리스 달성 시 상태 메시지 업데이트
		statusLabel.setText("테트리스!");
		statusLabel.setForeground(Color.YELLOW);

		// 일정 시간 후 원래 상태로 복원
		Timer messageTimer = new Timer(2000, e -> {
			if (gameRunning) {
				statusLabel.setText("게임 진행 중");
				statusLabel.setForeground(Color.GREEN);
			}
		});
		messageTimer.setRepeats(false);
		messageTimer.start();
	}

	private void updateLabels() {
		scoreLabel.setText("점수: " + String.format("%,d", score));
		linesLabel.setText("라인: " + lines);
		levelLabel.setText("레벨: " + level);
		tetrisLabel.setText("테트리스: " + tetrisCount);
	}

	private class TetrisKeyListener extends KeyAdapter {
		@Override
		public void keyPressed(KeyEvent e) {
			if (!gameRunning) {
				if (e.getKeyCode() == KeyEvent.VK_ENTER) {
					startNewGame();
					statusLabel.setText("게임 진행 중");
					statusLabel.setForeground(Color.GREEN);
				}
				return;
			}

			if (gamePaused && e.getKeyCode() != KeyEvent.VK_SPACE) {
				return;
			}

			switch (e.getKeyCode()) {
			case KeyEvent.VK_LEFT:
				if (canMove(currentPiece, -1, 0)) {
					currentPiece.x--;
				}
				break;
			case KeyEvent.VK_RIGHT:
				if (canMove(currentPiece, 1, 0)) {
					currentPiece.x++;
				}
				break;
			case KeyEvent.VK_DOWN:
				if (canMove(currentPiece, 0, 1)) {
					currentPiece.y++;
					score++; // 빠른 낙하 보너스
					updateLabels();
				}
				break;
			case KeyEvent.VK_UP:
				Tetromino rotated = currentPiece.getRotated();
				if (canMove(rotated, 0, 0)) {
					currentPiece = rotated;
				}
				break;
			case KeyEvent.VK_SPACE:
				gamePaused = !gamePaused;
				if (gamePaused) {
					timer.stop();
					statusLabel.setText("일시정지");
					statusLabel.setForeground(Color.ORANGE);
				} else {
					timer.start();
					statusLabel.setText("게임 진행 중");
					statusLabel.setForeground(Color.GREEN);
				}
				break;
			}
			gamePanel.repaint();
			nextPiecePanel.repaint();
		}
	}

	public static void main(String[] args) {
		SwingUtilities.invokeLater(() -> {
			try {
				UIManager.setLookAndFeel(UIManager.getLookAndFeel());
			} catch (Exception e) {
				e.printStackTrace();
			}
			new TetrisGame().setVisible(true);
		});
	}
}

class Tetromino {
	public int type;
	public int x, y;
	public int rotation; 

	// 테트로미노 모양 정의 (4x4 격자에서의 상대 좌표)
	private static final int[][][][] SHAPES = {
			// I 블록
			{ { { 0, 1 }, { 1, 1 }, { 2, 1 }, { 3, 1 } },
				{ { 2, 0 }, { 2, 1 }, { 2, 2 }, { 2, 3 } },
				{ { 0, 2 }, { 1, 2 }, { 2, 2 }, { 3, 2 } },
				{ { 1, 0 }, { 1, 1 }, { 1, 2 }, { 1, 3 } } },
			// O 블록
			{ { { 1, 1 }, { 2, 1 }, { 1, 2 }, { 2, 2 } },
				{ { 1, 1 }, { 2, 1 }, { 1, 2 }, { 2, 2 } },
				{ { 1, 1 }, { 2, 1 }, { 1, 2 }, { 2, 2 } },
				{ { 1, 1 }, { 2, 1 }, { 1, 2 }, { 2, 2 } } },
			// T 블록
			{ { { 1, 0 }, { 0, 1 }, { 1, 1 }, { 2, 1 } },
				{ { 1, 0 }, { 1, 1 }, { 2, 1 }, { 1, 2 } },
				{ { 0, 1 }, { 1, 1 }, { 2, 1 }, { 1, 2 } },
				{ { 1, 0 }, { 0, 1 }, { 1, 1 }, { 1, 2 } } },
			// S 블록
			{ { { 1, 0 }, { 2, 0 }, { 0, 1 }, { 1, 1 } },
				{ { 1, 0 }, { 1, 1 }, { 2, 1 }, { 2, 2 } },
				{ { 1, 1 }, { 2, 1 }, { 0, 2 }, { 1, 2 } },
				{ { 0, 0 }, { 0, 1 }, { 1, 1 }, { 1, 2 } } },
			// Z 블록
			{ { { 0, 0 }, { 1, 0 }, { 1, 1 }, { 2, 1 } },
				{ { 2, 0 }, { 1, 1 }, { 2, 1 }, { 1, 2 } },
				{ { 0, 1 }, { 1, 1 }, { 1, 2 }, { 2, 2 } },
				{ { 1, 0 }, { 0, 1 }, { 1, 1 }, { 0, 2 } } },
			// J 블록
			{ { { 0, 0 }, { 0, 1 }, { 1, 1 }, { 2, 1 } },
				{ { 1, 0 }, { 2, 0 }, { 1, 1 }, { 1, 2 } },
				{ { 0, 1 }, { 1, 1 }, { 2, 1 }, { 2, 2 } },
				{ { 1, 0 }, { 1, 1 }, { 0, 2 }, { 1, 2 } } },
			// L 블록
			{ { { 2, 0 }, { 0, 1 }, { 1, 1 }, { 2, 1 } },
				{ { 1, 0 }, { 1, 1 }, { 1, 2 }, { 2, 2 } },
				{ { 0, 1 }, { 1, 1 }, { 2, 1 }, { 0, 2 } },
				{ { 0, 0 }, { 1, 0 }, { 1, 1 }, { 1, 2 } } } };

	public Tetromino(int type, int x, int y) {
		this.type = type;
		this.x = x;
		this.y = y;
		this.rotation = 0;
	}

	public Tetromino(int type, int x, int y, int rotation) {
		this.type = type;
		this.x = x;
		this.y = y;
		this.rotation = rotation;
	}

	public Point[] getBlocks() {
		int[][] shape = SHAPES[type][rotation];
		Point[] blocks = new Point[4];
		for (int i = 0; i < 4; i++) {
			blocks[i] = new Point(x + shape[i][0] - 1, y + shape[i][1] - 1);
		}
		return blocks;
	}

	public Tetromino getRotated() {
		return new Tetromino(type, x, y, (rotation + 1) % 4);
	}
}