import org.junit.jupiter.api.Test;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

public class TestFrame {
    @Test
    public void testScoreNoThrows() {
        Frame f = new Frame();
        assertThat(0).isEqualTo(f.getScore());
    }

    @Test
    public void testAddOneThrow() {
        Frame f = new Frame();
        f.add(5);
        assertThat(5).isEqualTo(f.getScore());
    }
}
