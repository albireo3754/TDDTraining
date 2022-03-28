import org.junit.jupiter.api.Test;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

public class TestGame {

    @Test
    public void testOneThrow() {
        Game g = new Game();
        g.add(5);
        assertThat(5).isEqualTo(g.score());
    }
}
