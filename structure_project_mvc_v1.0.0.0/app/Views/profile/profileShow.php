<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:23/10/2023
 *Description:.....
 */
include_once('../app/Views/template/header.php');
$user = $data['profile'];


?>
<!--Container-->
<section class="row">
  <h3>Show Profile <button type="button" onclick="returnPage()" class="btn btn-success">
      <i class="bi bi-arrow-90deg-left"></i>
    </button>
  </h3>
  <!--Container form-->
  <form class="col-12" id="modalForm" action="#" method="POST" onsubmit="return validateData()">
    <div class="row">
      <input type="hidden" id="user_id" name="user_id" value="<?= $user[0]['user_id'] ?>">
      <div class="form-floating mb-3 col-6 text-center">
        <?php if (empty($user[0]['profile_photo'])): ?>
          <img src="../assets/img/icons/user.png" class="img img-fluid" width="100px" />
        <?php else: ?>
          <img src="<?=$user[0]['profile_photo']?>" class="img img-fluid" width="100px" />
        <?php endif ?>
      </div>
      <div class="form-floating mb-3 col-6">
        <input type="email" class="form-control form-control-sm" id="user_user" name="user_user"
          placeholder="name@example.com" value="<?=empty($user[0]['user_user'])?'':$user[0]['user_user']?>" disabled>
        <label for="floatingInput">Email address user</label>
      </div>
      <div class="col-6">
        <div class="input-group mb-3  ">
          <input type="password" class="form-control" id="user_password" name="user_password"
            value="<?=empty($user[0]['user_password'])?'':$user[0]['user_password']?>" placeholder="Password" aria-label="Example text with button addon"
            aria-describedby="button-addon1" disabled>
          <button class="btn btn-outline-secondary" type="button" onclick="changeTypeInput('user_password',this)"
            id="btn-password"><i class="bi bi-shield-lock"></i></button>
        </div>
      </div>
      <div class="form-floating mb-3 col-6">
        <input type="text" class="form-control form-control-sm" id="role_name" name="role_name"
          placeholder="name@example.com"  value="<?=empty($user[0]['role_name'])?'':$user[0]['role_name']?>"  disabled>
        <label for="floatingInput">Role user</label>
      </div>
      <div class="form-floating mb-3 col-6">
        <input type="text" class="form-control form-control-sm" id="user_status_name" name="user_status_name"
          placeholder="name@example.com" value="<?=empty($user[0]['user_status_name'])?'':$user[0]['user_status_name']?>"  disabled>
        <label for="floatingInput">Status user</label>
      </div>
      <div class="form-floating mb-3 col-6">
        <input type="text" class="form-control form-control-sm" id="profile_name" name="profile_name"
          placeholder="name@example.com" value="<?=empty($user[0]['profile_name'])?'':$user[0]['profile_name']?>" disabled>
        <label for="floatingInput">Name profile</label>
      </div>
      <div class="form-floating mb-3 col-6">
        <input type="text" class="form-control form-control-sm" id="document_type_name" name="document_type_name"
          placeholder="name@example.com" value="<?=empty($user[0]['document_type_name'])?'':$user[0]['document_type_name']?>" disabled>
        <label for="floatingInput">Documento type profile</label>
      </div>
      <div class="form-floating mb-3 col-6">
        <input type="text" class="form-control form-control-sm" id="profile_phone" name="profile_phone"
          placeholder="name@example.com" value="<?=empty($user[0]['profile_phone'])?'':$user[0]['profile_phone']?>"  disabled>
        <label for="floatingInput">Phone profile</label>
      </div>


    </div>

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
<script src="../controllers/profile/controllerProfile.js"> </script>