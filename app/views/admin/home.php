<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1><?php echo $data['mensaje'] ?></h1>
    <a href="<?=base_url()?>login">Login</a>
    <br>
    <a href="<?=base_url()?>customer">Ver Clientes</a>
</body>
</html>