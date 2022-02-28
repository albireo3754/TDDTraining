import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class DollarTests {
    @Test
    public void testMultiplication() {
        Dollar five = Money.dollar(5);
        assertEquals(Money.dollar(10), five.times(2));
        assertEquals(Money.dollar(15), five.times(3));
    }

    @Test
    public void testFrancMultiplication() {
        Franc franc = new Franc(5, null);
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
    }

    @Test
    public void testCurrency() {
        assertEquals("USD", Money.dollar(1).currency());
        assertEquals("CHF", Money.franc(1).currency());
    }
}
