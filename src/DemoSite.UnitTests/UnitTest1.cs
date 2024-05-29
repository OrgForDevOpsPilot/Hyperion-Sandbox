using DemoSite.Modules;

namespace DemoSite.UnitTests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestAddMethod()
        {
            // Arrange
            var functions = new Functions();
            int x = 5;
            int y = 3;
            int expected = 8;

            // Act
            int result = functions.Add(x, y);

            // Assert
            Assert.AreEqual(expected, result);
        }
    }
}
