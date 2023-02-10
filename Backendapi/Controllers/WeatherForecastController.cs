using Microsoft.AspNetCore.Mvc;

namespace Backendapi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        private static List<string> Summaries = new()
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<WeatherForecastController> _logger;

        public WeatherForecastController(ILogger<WeatherForecastController> logger)
        {
            _logger = logger;
        }

        [HttpGet(Name = "GetWeatherForecast")]
        public List<string> Get()
        {
            return Summaries;

        }

        [HttpGet("{index}")]
        public string GetIndex(int index)
        {
            if (index < 0 || index >= Summaries.Count)
            {
                return "������ � �������";
            }
            return Summaries[index];
        }
        [HttpPost]
        public IActionResult Add(string name)
        {
          if(name==null)
          {
               return BadRequest("������ ����");
          }
          Summaries.Add(name);
           return Ok();

        }
        [HttpPut]

        public IActionResult Update (int index,string name)
        {
            
            if(index<0||index>=Summaries.Count)
            {
                return BadRequest("������ ������� �� ���������� , ��������� ������������ ����� ������!");
            }
            if (name == null)
            {
                return BadRequest("������ ����");
            }

            Summaries[index] = name;
            return Ok();
        }
        [HttpDelete]
        public IActionResult Delete(int index)
        {
            if (index < 0 || index >= Summaries.Count)
            {
                return BadRequest("������ ������� �� ���������� , ��������� ������������ ����� ������!");
            }
            Summaries.RemoveAt(index);
            return Ok();
        }


    }
}