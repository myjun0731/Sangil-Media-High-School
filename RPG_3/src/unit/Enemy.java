package unit;

public class Enemy {
    private String name;
    private int hp;
    private int atk;
    private int def;
    private int level;

    // 생성자
    public Enemy(String name, int hp, int atk, int def) {
        this.name = name;
        this.hp = hp;
        this.atk = atk;
        this.def = def;
        this.level = 1; // 기본값
    }

    // 공격 메서드 (기본 물리 공격)
    public void attack(Player player) {
        int damage = Math.max(atk - player.getDef(), 0);
        player.takeDamage(damage);
        System.out.println(name + "이(가) " + player.getName() + "에게 " + damage + "의 피해를 입혔습니다!");
    }

    // 데미지 받기
    public void takeDamage(int damage) {
        hp -= damage;
        if (hp < 0) hp = 0;
        System.out.println(name + "의 HP가 " + damage + " 감소했습니다! (현재 HP: " + hp + ")");
    }

    // 생존 여부
    public boolean isAlive() {
        return hp > 0;
    }

    // 상태 출력
    public void printStatus() {
        System.out.println("\n[적 정보]");
        System.out.println("이름: " + name);
        System.out.println("레벨: " + level);
        System.out.println("HP: " + hp);
        System.out.println("공격력: " + atk);
        System.out.println("방어력: " + def);
    }

    // === Getter & Setter ===
    public String getName() {
        return name;
    }

    public int getHp() {
        return hp;
    }

    public int getAtk() {
        return atk;
    }

    public int getDef() {
        return def;
    }

    public int getLevel() {
        return level;
    }

    public void setHp(int hp) {
        this.hp = hp;
    }

    public void setAtk(int atk) {
        this.atk = atk;
    }

    public void setDef(int def) {
        this.def = def;
    }

    public void setLevel(int level) {
        this.level = level;
    }
}
