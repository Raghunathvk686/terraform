#Defining ssh key path

resource "aws_key_pair" "default" {
  key_name = "key"
  public_key ="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjFIK8qOWW4LPbSmOx4mq22d4zHomcki8ceIIfxe5HPt52rgCSjFjjB5IrgeOebNUCrQnf63de6Habr157uk2h0yPHiqbmz+rcopokKo9n0b3O7k+2ukaFuUUOMWLloeVdJnpsdMvMr2cRawH8CjhZJSNQCVfVRwN1av6HiEt4sHeMfb9jrWLZfFlOG17i1wDql86X1X13THQUx9hvOcQ4AWcQsFycMy70VCpiznd0+qF+MEQBrEGICFy5Pm5DgqwVu7vkE+HtqcNlObtB7glN7+B7Gy2EJCxMQuXcHlJqWkwpr86GJvRTgbUt6Pvjt1i9z6C9qSf/f4mv9Jvku7Mf raghu@raghu-Lenovo-G480"
}
