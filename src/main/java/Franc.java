public class Franc extends Money {
    Franc(int amount) {
        super(amount);
    }

    Franc times(int multiplier) {
        return new Franc(amount * multiplier);
    }
}