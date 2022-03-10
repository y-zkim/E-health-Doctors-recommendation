package tests;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import metier.services.UserImpl;

public class UserImplTest {

	private UserImpl userImpl;

    public UserImplTest() {}

    @BeforeAll
    static void setUpBeforeClass() throws Exception {
    }

    @AfterAll
    static void tearDownAfterClass() throws Exception {
    }

    @Test
    public void getNumbersOfUserVisiterTest(){
        this.userImpl = UserImpl.getInstance();
        Assertions.assertNotSame(this.userImpl.getNumbersOfUserVisiter(1) , 1000);
    }
    
    @Test
    public void isValidEmailTest(){
        this.userImpl = UserImpl.getInstance();
        Assertions.assertTrue(this.userImpl.isValidEmailAddress("email123@gmail.com"));;
    }

}
