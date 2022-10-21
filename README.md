join_bases

En este script se cargarán 2 bases de datos. La primera llamada "campanas vw" tiene información sobre las campañas pero no están los KPI de cada campaña. La segunda base tiene los KPI de Facebook Ads Manager y se llamará "kpi_campanas". 

Ambas bases comparten la variable "Impresiones" por lo tanto la idea es crear las bbdd, limpiarlas y cambiar formatos de variable (probablemente variables numéricas que están dispuestas como caracteres). Luego de limpiarlas se procederá a hacer un inner join para juntar las bases en base al Mes y cantidad de Impresiones que comparten, ya que hay campañas con el mismo nombre que duran más de un mes.
