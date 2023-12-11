global class FetchAccount1

{

webservice static Account createAccount(String Name) {

Account acct = new Account();

acct.Name = Name;

insert acct;
return acct;
}

}