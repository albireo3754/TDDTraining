abstract class Money {
    protected int amount;
    protected String currency;

    abstract Money times(int multiplier);
    abstract String currency();

    public boolean equals(Object object) {
        Money money = (Money) object;
        System.out.println(money.amount);
        return amount == money.amount;
    }

    static Dollar dollar(int amount) {
        return new Dollar(amount, "USD");
    }

    static Franc franc(int amount) {
        return new Franc(amount, "CHF");
    }
}
