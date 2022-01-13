public class Dollar extends Money {
    Dollar(int amount, String currency) {
        super(amount);
        this.currency = "USD";
    }

    Money times(int multiplier) {
        return Money.dollar(amount * multiplier);
    }
}
