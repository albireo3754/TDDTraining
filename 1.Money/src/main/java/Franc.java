public class Franc extends Money {
    private String currency;

    public Franc(int amount, String currency) {
        this.amount = amount;
        this.currency = currency;
    }

    Money times(int multiplier) {
        return Money.franc(this.amount * multiplier);
    }

    String currency() {
        return currency;
    }
}
