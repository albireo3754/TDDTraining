class Sum implements Expression {
    Expression augend;
    Expression addend;

    // 나중에 컴포지트 패턴으로 바꿀 수 있음
    Sum(Expression augend, Expression addend) {
        this.augend = augend;
        this.addend = addend;
    }

    public Money reduce(Bank bank, String to) {
        int amount = augend.reduce(bank, to).amount + addend.reduce(bank,to).amount;
        return new Money(amount, to);
    }

    // TODO: stub을 나중에 교체해야함
    public Expression plus(Expression addend) {
        return new Sum(this, addend);
    }

    public Expression times(int multiplier) {
        return new Sum(augend.times(multiplier), addend.times(multiplier));
    }
}
