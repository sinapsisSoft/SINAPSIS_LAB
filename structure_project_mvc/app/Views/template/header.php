<?php
use App\Controllers\User\UserController;


session_start();
if (!isset($_SESSION["newsession"])) {
  header("Location: " . DEFAULT_ROUTE);
} else {

  $User = new UserController();
  $id = $_SESSION["newsession"];
  $attributesId="user_id";
  $modules = $User->userModule($id);

}

?>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="<?= APP_URL_PUBLIC ?>home/show"><img class="img img-fluid " width="80px"
        src="../assets/img/logos/logo.webp"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <?php foreach ($modules as $module): ?>
          <li class="nav-item">
            <a class="nav-link" href="<?= APP_URL_PUBLIC . $module['module_route'] ?>">
              <?= $module['module_name'] ?>
            </a>
          </li>
        <?php endforeach ?>

      </ul>
      <div class="topnav" style="margin-right: 100px;">
        <ul class="navbar-nav me-auto ">

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
              aria-expanded="false">
              <i class="bi bi-person-circle"></i> USER
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="<?= APP_URL_PUBLIC ?>profile/show?<?=$attributesId?>=<?=$id?>" >Profile</a></li>

              <li>
                <hr class="dropdown-divider">
              </li>
              <li><a class="dropdown-item" href="<?= APP_URL_PUBLIC ?>login/signOff">Sign off</a></li>
            </ul>
          </li>

        </ul>
      </div>
    </div>
  </div>
</nav>