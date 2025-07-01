# Quy trình làm việc với Terraform

Dưới đây là quy trình làm việc chi tiết với Terraform để triển khai và quản lý dự án AWS của bạn.

## 1. Khởi tạo dự án

```bash
terraform init
```

Lệnh này sẽ:
- Tải về các provider cần thiết (AWS trong trường hợp này)
- Chuẩn bị thư mục `.terraform` để lưu trữ các file cấu hình
- Chuẩn bị file trạng thái (state file)

## 2. Định dạng mã nguồn

```bash
terraform fmt
```

Lệnh này sẽ định dạng lại các file `.tf` theo chuẩn của Terraform, giúp mã nguồn dễ đọc và nhất quán.

## 3. Kiểm tra cú pháp

```bash
terraform validate
```

Lệnh này sẽ kiểm tra cú pháp của các file cấu hình Terraform, đảm bảo không có lỗi cú pháp.

## 4. Xem trước thay đổi

```bash
terraform plan
```

Lệnh này sẽ:
- So sánh trạng thái hiện tại với cấu hình mong muốn
- Hiển thị danh sách các thay đổi sẽ được thực hiện
- Không thực hiện bất kỳ thay đổi nào trên thực tế

Bạn có thể lưu kế hoạch vào file để sử dụng sau:

```bash
terraform plan -out=tfplan
```

## 5. Áp dụng thay đổi

```bash
terraform apply
```

Hoặc áp dụng từ file kế hoạch đã lưu:

```bash
terraform apply tfplan
```

Lệnh này sẽ:
- Thực hiện các thay đổi đã được xác định trong bước plan
- Cập nhật file trạng thái
- Hiển thị các output được định nghĩa

## 6. Kiểm tra trạng thái

```bash
terraform state list
```

Liệt kê tất cả các tài nguyên trong file trạng thái.

```bash
terraform state show aws_lambda_function.function
```

Hiển thị thông tin chi tiết về một tài nguyên cụ thể.

## 7. Xem output

```bash
terraform output
```

Hiển thị tất cả các output.

```bash
terraform output api_gateway_url
```

Hiển thị một output cụ thể.

## 8. Cập nhật tài nguyên

Sau khi chỉnh sửa các file cấu hình, bạn có thể chạy lại `terraform plan` và `terraform apply` để cập nhật tài nguyên.

## 9. Xóa tài nguyên

```bash
terraform destroy
```

Lệnh này sẽ xóa tất cả tài nguyên được quản lý bởi Terraform.

Để xóa một tài nguyên cụ thể:

```bash
terraform destroy -target=aws_lambda_function.function
```

## 10. Quản lý workspace

Terraform workspace cho phép bạn quản lý nhiều môi trường (dev, staging, production) trong cùng một dự án.

```bash
# Liệt kê workspace
terraform workspace list

# Tạo workspace mới
terraform workspace new dev

# Chuyển đổi workspace
terraform workspace select prod

# Hiển thị workspace hiện tại
terraform workspace show
```

## 11. Nhập khẩu tài nguyên hiện có

Nếu bạn có tài nguyên AWS đã tồn tại và muốn quản lý chúng bằng Terraform:

```bash
terraform import aws_s3_bucket.app_bucket my-existing-bucket
```

## 12. Làm việc với module

Để sử dụng module từ Terraform Registry:

```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"
  
  name = "my-vpc"
  cidr = "10.0.0.0/16"
  # Các tham số khác...
}
```

## 13. Quản lý biến nhạy cảm

Sử dụng biến nhạy cảm để tránh lưu trữ thông tin nhạy cảm trong mã nguồn:

```bash
# Đặt biến môi trường
export TF_VAR_db_password="secret"

# Hoặc sử dụng file .tfvars riêng không được commit vào git
echo 'db_password = "secret"' > secrets.tfvars
terraform apply -var-file=secrets.tfvars
```

## 14. Sử dụng backend từ xa

Để lưu trữ file trạng thái trên S3 và sử dụng DynamoDB cho khóa:

```hcl
terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
```

## 15. Tài liệu tham khảo

- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Best Practices](https://www.terraform-best-practices.com/)
