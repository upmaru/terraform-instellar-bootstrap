terraform {
  required_version = ">= 1.0.0"

  required_providers {
    instellar = {
      source  = "upmaru/instellar"
      version = "~> 0.7"
    }

    time = {
      source  = "hashicorp/time"
      version = "~> 0.11"
    }
  }
}