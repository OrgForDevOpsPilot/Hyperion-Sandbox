using System;
using System.Data.SqlClient;
using System.Net.Http;
using System.Threading.Tasks;

namespace DemoCoreServices
{
    public class CoreFunctionality
    {
        public string Display()
        {
            return "This class has core functionality";
        }

        // 明確な SQL インジェクションの脆弱性（CodeQLが検知しやすい）
        public void GetUserData(string userInput)
        {
            using (SqlConnection connection = new SqlConnection("Server=myServerAddress;Database=myDataBase;User Id=myUsername;Password=myPassword;"))
            {
                connection.Open();
                string sql = "SELECT * FROM Users WHERE Name = '" + userInput + "'";
                SqlCommand command = new SqlCommand(sql, connection);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    Console.WriteLine(reader["Name"]);
                }
            }
        }

        // ハードコードされたAPIキーを使ってHTTPリクエストを送信（Secret Scanning + Autofixのトリガー）
        public async Task<string> CallExternalServiceAsync()
        {
            string apiKey = "AKIAIOSFODNN7EXAMPLE"; // <- シークレットスキャン用
            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + apiKey);
                HttpResponseMessage response = await client.GetAsync("https://example.com/api/data");
                return await response.Content.ReadAsStringAsync();
            }
        }
    }
}
