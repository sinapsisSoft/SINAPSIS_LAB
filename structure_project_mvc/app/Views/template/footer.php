<footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">

      <?php foreach ($modules as $module): ?>
          <li class="nav-item">
            <a class="nav-link px-2 text-muted" href="<?= APP_URL_PUBLIC . $module['module_route'] ?>">
              <?= ucfirst($module['module_name']) ?>
            </a>
          </li>
        <?php endforeach ?>
    </ul>
    <p class="text-center text-muted">© 2022 Company, Inc</p>
  </footer>