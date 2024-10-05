using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

// Agregamos todas las referencias
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using SistemaVenta.DALL.DBContext;
using Microsoft.EntityFrameworkCore;
//using SistemaVenta.DALL.Interfaces;
//using SistemaVenta.DALL.Implementacion;
//using SistemaVenta.BLL.Interfaces;
//using SistemaVenta.BLL.Implementacion;

namespace SistemaVenta.IOC
{
    public static class Dependencia
    {
        // Logica
        public static void InyectarDependencia(this IServiceCollection services, IConfiguration configuration) {
            services.AddDbContext<DBVENTAContext>(options => {
                options.UseSqlServer(configuration.GetConnectionString("CadenaSQL")); // Ponemos nuestra cadena de conexion
            });
        }

    }
}
