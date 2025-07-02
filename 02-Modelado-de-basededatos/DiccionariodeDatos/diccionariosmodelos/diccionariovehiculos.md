# 📘 Diccionario de Datos – Vehiculos

**Tabla Cliente**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumCliente`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                        | -                                | Identificador del cliente               |
| `Nombre`        | NVARCHAR      | 20    | ❌  | ❌  | ❌   | ❌     | -            | -                                | Nombre completo del cliente             |
| `Apellido1`          | NVARCHAR          | 20     | ❌  | ❌  | ❌   | ❌     |  -          | -                                | Apellido del Cliente
| `Apellido2`      | NVARCHAR         | 20      | ❌  |  ❌ | ❌   | ❌     | -                                       |         -     |Apellido 1 del cliente    |
| `Apellido2`      | INT          | -      | ❌  |  ❌ | ❌   | ❌     | -                                       |         -     |Apellido 2 del cliente    |
| `curp`      | nchar          | 18      | ❌  |  ❌ | ❌   | ✅     | -                                       |         -     |Curp del Cliente    |
| `telefono`      | nchar          | 12      | ❌  |  ❌ | ✅   | ❌     | -                                       |         -     |Telefono del Cliente    |


**Tabla Sucursal**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumeroSucursal`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                        | -                                | Identificador de la sucursal             |
| `NombreSucursal`     | nvarchar          | 20      | ❌  | ❌  | ❌   | ✅     | -                                        | -                                | Nombre de la Sucursal             |
| `Ubicación`     | nvarchar          | 20      | ❌  | ❌  | ❌   | ✅     | -                                        | -                                | Ubicación de la sucursal             |

**Tabla Vehiculo**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumeroVehiculo`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                        | -                                | Identificador de vehiculo             |
| `Placa`     | nchar          | 7      | ❌  | ❌  | ❌   | ✅     | -                                        | -                                | Nombre de la Placa             |
| `Marca`     | nvarchar          | 15      | ❌  | ❌  | ❌   |   ❌   | -                                        | -                                | Marca del Vehiculo             |           |
| `Modelo`     | nvarchar          | 20      | ❌  | ❌  | ❌   |   ❌   | -                                        | -                                | Modelo del Vehiculo             |
| `Anio`     | int          | -      | ❌  | ❌  | ❌   |   ❌   | -                                        | -                                | Año del Vehiculo             |
| `NumCliente`     | int          | -    | ❌  | ✅  | ❌   |   ❌   | -                                        | Cliente(NumCliente)                                 | El cliente que renta el Vehiculo             |
| `NumSucursal`     | int          | -    | ❌  | ✅  | ❌   |   ❌   | -                                        | Sucursal(Numsucursal)                                 | La sucursal donde se encuentra el vehiculo             |


