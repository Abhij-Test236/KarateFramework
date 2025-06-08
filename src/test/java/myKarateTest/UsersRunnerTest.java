package myKarateTest;


import com.intuit.karate.junit5.Karate;

class UsersRunnerTest {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run().tags("@jsonvalidate1").relativeTo(getClass());
    } 

}
