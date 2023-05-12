@isTest
public class TestSampleApexClass {
  public static void createAccounts(Integer amount) {
    List<Account> accounts = new List<Account>();

    for (Integer i = 1; i <= amount; i++) {
      accounts.add(new Account(Name = 'Name ' + i));
    }

    insert accounts;
  }

  @isTest
  static void getAccountList() {
    TestSampleApexClass.createAccounts(10);

    Test.startTest();
    List<Account> accts = SampleApexClass.getAccountList();
    Test.stopTest();

    Assert.areEqual(10, accts.size());
  }

  @isTest
  static void getSingleAccount() {
    TestSampleApexClass.createAccounts(1);

    Test.startTest();
    Account acc = SampleApexClass.getSingleAccount();
    Test.stopTest();

    Assert.areEqual('Name 1', acc.Name);
  }
}
