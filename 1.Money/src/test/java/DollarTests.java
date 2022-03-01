import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class DollarTests {
    @Test
    public void testMultiplication() {
        Money five = Money.dollar(5);
        assertEquals(Money.dollar(10), five.times(2));
        assertEquals(Money.dollar(15), five.times(3));
    }

    @Test
    public void testFrancMultiplication() {
        Money franc = new Money(5, "CHF");
        assertEquals(Money.franc(10), franc.times(2));
        assertEquals(Money.franc(15), franc.times(3));
    }

    @Test
    public void testEquality() {
        assertTrue(Money.dollar(5).equals(Money.dollar(5)));
        assertFalse(Money.dollar(5).equals(Money.dollar(6)));
        assertEquals(Money.franc(5), Money.franc(5));
//        assertTrue(new Franc(5).equals(new Franc(6)));
        assertNotEquals(Money.franc(5), Money.franc(6));
        assertNotEquals(Money.dollar(5), Money.franc(5));
    }

    @Test
    public void testDifferentClassEquality() {
        assertTrue(new Money(10, "CHF").equals(new Money(10, "CHF")));
    }

    @Test
    public void testCurrency() {
        assertEquals("USD", Money.dollar(1).currency());
        assertEquals("CHF", Money.franc(1).currency());
    }

    @Test
    public void testSimpleAddition() {
        Money five = Money.dollar(5);
        Expression sum = five.plus(five);
        Bank bank = new Bank();
        Money reduced = bank.reduce(sum, "USD");
        assertEquals(Money.dollar(10), reduced);
    }

    @Test
    public void testPlusReturnsSum() {
        Money five = Money.dollar(5);
        Expression result = five.plus(five);
        Sum sum = (Sum) result;
        assertEquals(five, sum.augend);
        assertEquals(five, sum.addend);
    }

    @Test
    public void testReduceSum() {
        Expression sum = new Sum(Money.dollar(3), Money.dollar(4));
        Bank bank = new Bank();
        Money result = bank.reduce(sum, "USD");
        assertEquals(Money.dollar(7), result);
    }

    @Test
    public void testReduceMoney() {
        Bank bank = new Bank();
        Money result = bank.reduce(Money.dollar(1), "USD");
        assertEquals(Money.dollar(1), result);
    }

    @Test
    public void testIdentityRate() {
        assertEquals(1, new Bank().rate("USD", "USD"));
    }

    @Test
    public void testReduceMoneyDifferentCurrency() {
        Bank bank = new Bank();
        bank.addRate("CHF", "USD", 2);
        Money result = bank.reduce(Money.franc(2), "USD");
        assertEquals(Money.dollar(1), result);
    }

    @Test
    public void testMixedAddition() {
        Expression fiveBucks = Money.dollar(5);
        Expression tenFrancs = Money.franc(10);
        Bank bank = new Bank();
        bank.addRate("CHF", "USD", 2);
        Money result = bank.reduce(fiveBucks.plus(tenFrancs), "USD");
        assertEquals(Money.dollar(10), result);
    }

    @Test
    public void testSumPlusMoney() {
        Expression fiveBucks = Money.dollar(5);
        Expression tenFrancs = Money.franc(10);
        Expression sevenBucks = Money.dollar(7);
        Bank bank = new Bank();
        bank.addRate("CHF", "USD", 2);
        // Sum을 bank.reduce를 이용해서 만들 수 도 있었겠지만 좀 더 직관적으로 sum이란 것을 나타내기 위해서 직접 선언하였음
        Expression sum = new Sum(fiveBucks, tenFrancs).plus(sevenBucks);
        Money result = bank.reduce(sum, "USD");
        assertEquals(Money.dollar(17), result);
    }

//    // 실패할 테스트 작성 후 제대로 되지않자 버린다.
//    @Test
//    public void testPlusSameCurrencyReturnsMoney() {
//        Expression sum = Money.dollar(1).plus(Money.dollar(1));
//        assertTrue(sum instanceof Money);
//    }
//
//    @Test
//    public void testSumTimes() {
//        Expression fiveBucks = Money.dollar(5);
//        Expression tenFrancs = Money.franc(10);
//        Bank bank = new Bank();
//        bank.addRate("CHF", "USD", 2);
//        Expression times = new Sum(fiveBucks, tenFrancs).times(2);
//        Money result = bank.reduce(times, "USD");
//        assertEquals(Money.dollar(20), result);
//    }
    // "abc" 배열을 해쉬로 사용할 수 없음을 보여주는 예제
//    @Test
//    public void testArrayEquals() {
//        assertEquals(new Object[] {"abc"}, new Object[] {"abc"});
//    }
}
