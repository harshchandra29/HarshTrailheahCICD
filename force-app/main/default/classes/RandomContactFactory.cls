public class RandomContactFactory 
{
    public static List<Contact> generateRandomContacts(Integer NumberofContacts, String lName)
    {
        List<Contact> con = new List<Contact>();
        for(Integer i=0; i<NumberofContacts; i++){
            
            Contact c = new Contact(FirstName=lName+i, LastName=lName);
            con.add(c);
        }
        return con;
    }

}