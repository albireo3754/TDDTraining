import org.junit.jupiter.api.Test;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

public class TestGame {

    @Test
    public void testOneThrow() {
        Game g = new Game();
        g.add(5);
        assertThat(5).isEqualTo(g.score());
    }

    @Test
    public void testTwoThrowsNoMark() {
        Game g = new Game();
        g.add(5);
        g.add(4);
        assertThat(9).isEqualTo(g.score());
    }

    @Test
    public void testFourThrowsNoMark() {
        Game g = new Game();
        g.add(5);
        g.add(4);
        g.add(7);
        g.add(2);
        assertThat(18).isEqualTo(g.score());
        assertThat(9).isEqualTo(g.scoreForFrame(1));
        assertThat(18).isEqualTo(g.scoreForFrame(2));
    }
}
