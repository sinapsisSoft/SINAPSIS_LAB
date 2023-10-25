<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:20/10/2023
 *Description:.....
 */
include_once('../app/Views/template/header.php');
$users = $data['users'];
$userStatus = $data['userStatus'];
$roles = $data['roles'];


?>
<!--Container-->
<section class="row">
  <h3>Manage User <button type="button" onclick="resetForm()" class="btn btn-success" data-bs-toggle="modal"
      data-bs-target="#appModal">
      <i class="bi bi-plus-square-fill"></i>
    </button>
  </h3>
  <!--Container table-->
  <div class="table-responsive">
    <table class="table table-sm">
      <thead class="table-dark">
        <tr style="text-align: center;">
          <th scope="col">#</th>
          <th scope="col">User</th>
          <th scope="col">Password</th>
          <th scope="col">Role</th>
          <th scope="col">State</th>
          <th scope="col">Last Update</th>
          <th scope="col">Actions</th>
        </tr>
      </thead>
      <tbody>
        <?php
        $count = 1;
        foreach ($users as $user): ?>
          <tr style="text-align: center;">
            <td>
              <?= $count++ ?>
            </td>
            <td>
              <?= $user[1] ?>
            </td>
            <td>
              <input style="width: 100%; border: none; text-align:center" type="password"
                value="<?= substr($user[2], 0, 10) ?>" disabled />
            </td>
            <td>
              <?= $user[3] ?>
            </td>
            <td>
              <?= $user[4] ?>
            </td>
            <td>
              <?= $user[5] ?>
            </td>
            <td>
              <!--Container button group actions-->
              <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                <button type="button" onclick="show( <?= $user[0] ?>)" class="btn btn-info"><i class="bi bi-eye-fill"></i></button>
                <button type="button" onclick="edit( <?= $user[0] ?>)"class="btn btn-warning"><i class="bi bi-pencil-square"></i></button>
                <button type="button" onclick="delete_( <?= $user[0] ?>)"class="btn btn-danger"><i class="bi bi-trash-fill"></i></button>
              </div>
              <!--Container end button group actions-->
            </td>
          </tr>
        <?php endforeach ?>
      </tbody>
    </table>
    <!--Container end table-->
  </div>
</section>
<!--End Container-->

<!--Container Modal-->
<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="appModal" tabindex="-1" aria-labelledby="appModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="appModalLabel">Modal app</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!--Container form-->
        <form id="modalForm" action="<?= APP_URL_PUBLIC ?>user/create" method="POST" onsubmit="return validateData()">
          <input type="hidden" id="user_id" name="user_id">
          <div class="form-floating mb-3">
            <input type="email" class="form-control form-control-sm" id="user_user" name="user_user"
              placeholder="name@example.com" required>
            <label for="floatingInput">Email address user</label>
          </div>
          <div class="input-group mb-3 input-group-sm ">
            <input type="password" class="form-control" id="user_password" name="user_password" placeholder="Password"
              aria-label="Example text with button addon" aria-describedby="button-addon1">
            <button class="btn btn-outline-secondary" type="button" onclick="changeTypeInput('user_password',this)"
              id="btn-password"><i class="bi bi-shield-lock"></i></button>
          </div>
          <div class="input-group mb-3 input-group-sm ">
            <input type="password" class="form-control" id="user_password_repeat" name="user_password_repeat"
              placeholder="Password repeat" aria-label="Example text with button addon"
              aria-describedby="button-addon1">
            <button class="btn btn-outline-secondary" type="button"
              onclick="changeTypeInput('user_password_repeat',this)" id="btn-password-repeat"><i
                class="bi bi-shield-lock"></i></button>
          </div>
          <!--Container select -->
          <select class="form-select form-select-sm mb-3" id="role_id" name="role_id" aria-label="Small select example"
            required>
            <option selected value="">Open this select role</option>
            <?php foreach ($roles as $role): ?>
              <option value="<?= $role[0] ?>">
                <?= $role[1] ?>
              </option>
            <?php endforeach ?>
          </select>
          <!--Container end select -->
          <!--Container select -->
          <select class="form-select form-select-sm mb-3" id="user_status_id" name="user_status_id"
            aria-label="Small select example" required>
            <option selected value="">Open this select status</option>
            <?php foreach ($userStatus as $statu): ?>
              <option value="<?= $statu[0] ?>">
                <?= $statu[1] ?>
              </option>
            <?php endforeach ?>
          </select>
          <!--Container end select -->
        </form>
        <!--Container end form-->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" form="modalForm" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<!--End Container Modal-->
<?php
include_once('../app/Views/template/footer.php');
?>
<!-- Container Jscript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  <script src="../assets/js/constans.js"> </script>
  <script src="../controllers/user/controllerUser.js"> </script>