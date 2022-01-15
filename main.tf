data "template_file" "reg_script" {
  template = "${file("./templates/register.sh.tpl")}"

   vars = {
    GITHUB_ACCESS_TOKEN = "${var.github_access_token}"
    GITHUB_USERNAME     = "${var.github_username}"
    GITHUB_REPO_NAME    = "${var.github_repo_name}"
  }
}

data "template_cloudinit_config" "script" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.reg_script.rendered}"
  }
}

resource "google_compute_instance" "vm_instance" {
  name         = "my-self-hosted-runner"
  machine_type = "e2-micro"
  allow_stopping_for_update = true
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }
  metadata_startup_script = "${data.template_cloudinit_config.script.rendered}"
}