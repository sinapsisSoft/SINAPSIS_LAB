<?php
$session = false;
if (!isset($_SESSION["newsession"])) {
  $session = false;
} else {
  $session = true;
}
?>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="../../assets/img/icons/logo.png" width="80" class="img-fluid" />
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Gestión de Usuario
          </a>
          <ul class="dropdown-menu">
            <?php
            if ($session) {
              echo ('<li><a class="dropdown-item" href="../../view/login/">Registrate Aquí</a></li>
                  <li><a class="dropdown-item" href="../../controller/login/close.php">Cerrar Sesión</a></li>');

            } else {
              echo ('<li><a class="dropdown-item" href="../../view/login/">Registrate Aquí</a></li>
<li><a class="dropdown-item" href="../../view/login/">Iniciar Sesión</a></li>');
            }
            ?>

          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="../../view/home/" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Productos</a>
        </li>


      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit"><svg xmlns="http://www.w3.org/2000/svg" width="16"
            height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
            <path
              d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
          </svg></button>
      </form>
    </div>
  </div>
</nav>