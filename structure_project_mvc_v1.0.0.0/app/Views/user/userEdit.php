<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:20/10/2023
 *Description:.....
 */
include_once('../app/Views/template/header.php');
$user = $data['user'];
$userStatus = $data['userStatus'];
$roles = $data['roles'];

?>
<!--Container-->
<section class="row">
  <h3>Edit User <button type="button" onclick="returnPage()" class="btn btn-success">
      <i class="bi bi-arrow-90deg-left"></i>
    </button>
  </h3>
  <!--Container form-->
  <form id="modalForm" action="<?= APP_URL_PUBLIC ?>user/update" method="POST">
    <input type="hidden" id="user_id" name="user_id" value="<?= $user[0]['user_id'] ?>">
    <div class="form-floating mb-3">
      <input type="email" class="form-control form-control-sm" id="user_user" name="user_user"
        placeholder="name@example.com" value="<?= $user[0]['user_user'] ?>" required>
      <label for="floatingInput">Email address user</label>
    </div>

    <input type="hidden" class="form-control" id="user_password" name="user_password"
      value="<?= $user[0]['user_password'] ?>" placeholder="Password" aria-label="Example text with button addon"
      aria-describedby="button-addon1" >

    <!--Container select -->
    <select class="form-select form-select-sm mb-3" id="role_id" name="role_id" aria-label="Small select example"
      required>
      <option value="">Open this select role</option>
      <?php foreach ($roles as $role): ?>
        <?php if ($role[1] == $user[0]['role_name']): ?>
          <option value="<?= $role[0] ?>" selected>
            <?= $role[1] ?>
          </option>
        <?php else: ?>
          <option value="<?= $role[0] ?>">
            <?= $role[1] ?>
          </option>
        <?php endif ?>
      <?php endforeach ?>
    </select>
    <!--Container end select -->

    <select class="form-select form-select-sm mb-3" id="user_status_id" name="user_status_id"
      aria-label="Small select example" required>
      <option value="">Open this select status</option>
      <?php foreach ($userStatus as $statu): ?>
        <?php if ($statu[1] == $user[0]['user_status_name']): ?>
          <option value="<?= $statu[0] ?>" selected>
            <?= $statu[1] ?>
          </option>
        <?php else: ?>
          <option value="<?= $statu[0] ?>">
            <?= $statu[1] ?>
          </option>
        <?php endif ?>
      <?php endforeach ?>
    </select>
    <!--Container end select -->

    <button type="submit" form="modalForm" class="btn btn-primary w-100">Save changes</button>
    <!--Container end select -->
  </form>

  <!--Container end form-->

</section>
<!--End Container-->

<!--Container Modal-->
<!-- Button trigger modal -->


<?php
include_once('../app/Views/template/footer.php');
?>
<!-- Container Jscript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="../assets/js/constans.js"> </script>
<script src="../controllers/user/controllerUser.js"> </script>