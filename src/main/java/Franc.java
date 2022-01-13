public class Franc extends Money {
    Franc(int amount) {
        super(amount);
    }

    Money times(int multiplier) {
        return new Franc(amount * multiplier);
    }
}