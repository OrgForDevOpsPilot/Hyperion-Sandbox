using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
//using DemoCoreServices;     //・・・①

namespace DemoSite.Pages;

public class IndexModel : PageModel
{
    private readonly ILogger<IndexModel> _logger;

    [BindProperty]
    public string SystemMessageText { get; set; } = string.Empty;
    [BindProperty]
    public string ArtifactsLibraryText { get; set; } = string.Empty;    //・・・②

    public IndexModel(ILogger<IndexModel> logger)
    {
        _logger = logger;
    }

    public void OnGet()
    {
        this.SystemMessageText = Environment.GetEnvironmentVariable("MESSAGE");
        //CoreFunctionality coreFunctionality = new CoreFunctionality();
        //this.ArtifactsLibraryText = coreFunctionality.Display();    //・・・③
    }
}
