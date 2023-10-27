<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:20/10/2023
 *Description:.....
 */
include_once('../app/Views/template/headerLogin.php');
if(isset($data['message'])){
  $messageText = $data['message'];
}


?>
<!--Container-->
<section class="row">
  <h3>Login User </h3>
  <!--Container form-->
  <form id="loginForm" action="<?= APP_URL_PUBLIC ?>login/login" method="POST">

    <div class="form-floating mb-3">
      <input type="email" class="form-control form-control-sm" id="user_user" name="user_user"
        placeholder="name@example.com" value="" required>
      <label for="floatingInput"> User Email</label>
    </div>
    <div class="input-group mb-3 input-group-sm ">
      <input type="password" class="form-control" id="user_password" name="user_password" value=""
        placeholder="Password" aria-label="Example text with button addon" aria-describedby="button-addon1" required>
      <button class="btn btn-outline-secondary" type="button" onclick="changeTypeInput('user_password',this)"
        id="btn-password"><i class="bi bi-shield-lock"></i></button>
    </div>
    <?php if(isset($messageText)):?>
    <div class="alert alert-warning" role="alert">
    <?= $messageText?>
    </div>
    <?php endif ?>
    <button type="submit" form="loginForm" class="btn btn-primary w-100">Save changes</button>
  </form>

  <!--Container end form-->

</section>
<!--End Container-->

<!--Container Modal-->
<!-- Button trigger modal -->


<?php
include_once('../app/Views/template/footerLogin.php');
?>
<!-- Container Jscript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="../assets/js/constans.js"> </script>
<script src="../controllers/login/controllerLogin.js"> </script>