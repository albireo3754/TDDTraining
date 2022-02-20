public interface Expression {
    int amount = 0;

    Money reduce(String to);

    Money reduce(Bank bank, String to);

    Expression plus(Expression addend);
}
