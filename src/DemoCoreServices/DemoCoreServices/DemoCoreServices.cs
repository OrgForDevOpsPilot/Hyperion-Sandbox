namespace DemoCoreServices
{
    public class CoreFunctionality
    {
        public string Display()
        {
            return "This class has core functionality";
        }

        // 脆弱性のあるメソッド（SQLインジェクション）Copilot Autofix検証用
        public string GetUserData(string userInput)
        {
            string query = "SELECT * FROM Users WHERE Name = '" + userInput + "';";
            return "Executing query: " + query;
        }

        // ハードコードされたシークレット（シークレットスキャン用）
        private string apiKey = "AKIAIOSFODNN7EXAMPLE";
    }
}
