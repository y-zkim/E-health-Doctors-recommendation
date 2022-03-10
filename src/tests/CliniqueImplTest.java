package tests;

import org.junit.jupiter.api.*;

import metier.services.CliniqueImpl;

public class CliniqueImplTest {
	
	private CliniqueImpl cliniqueImpl;

    public CliniqueImplTest() {}

    @BeforeAll
    static void setUpBeforeClass() throws Exception {
    }

    @AfterAll
    static void tearDownAfterClass() throws Exception {
    }

    @Test
    public void testSansFrais(){
        this.cliniqueImpl = CliniqueImpl.getInstance();
    }
}
