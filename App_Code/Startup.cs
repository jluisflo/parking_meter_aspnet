using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SistemaParquimetro.Startup))]
namespace SistemaParquimetro
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
