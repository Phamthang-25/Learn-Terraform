## 1. Infrastructure as Code là gì?
- IaC: là một phương pháp quản lý và cấu hình cơ sở hạ tầng CNTT tự động hóa thông qua code
- Thay vì thực hiện cấu hình và quản lý hạ tầng một cách thủ công và trực tiếp, người ta có thể sử dụng mã nguồn (script, template) để tự động hóa các công việc này
- **Ưu điểm** khi triển khai Infrastructure as Code:
    - **Tự động hóa**: giúp giảm thiểu rủi ro và tăng tốc độ triển khai
    - **Nhất quán và Dễ dàng kiểm soát**:
        - Đảm bảo rằng môi trường được cấu hình một cách nhất quán và đúng đắn
        - Kiểm soát phiên bản cho phép quản lý, theo dõi và phục hồi phiên bản cấu hình
    - **Tích hợp và Phối hợp**:
        - Tích hợp với DevOps tạo điều kiện cho việc phát triển và vận hành liền mạch
        - Phối hợp với các công cụ khác: Dễ dàng tích hợp và phối hợp với các công cụ và dịch vụ khác như CI/CD, monitor, và log
    - **Tối ưu hoá tài nguyên và chi phí**: Thông qua việc tái sử dụng, giảm bớt công sức và thời gian của đội ngũ kỹ sư, giúp tiết kiệm chi phí
    - **An toàn và Bảo mật**:
        - Quản lý quyền truy cập: Dễ dàng quản lý và kiểm soát quyền truy cập
        - Tích hợp bảo mật: Có thể tích hợp các chuẩn và quy tắc bảo mật vào trong quá trình cấu hình và triển khai

## 2. Cơ bản về Terraform
- Provider: HashiCorp
- Ngôn ngữ: HashiCorp Configuration Language (HCL)
- Hỗ trợ cloud: AWS, GCP, Azure, ...
- **Các thành phần cơ bản cuae Terraform**:
    - **Template Files (.tf)**: Các tệp cấu hình được viết bằng HCL, mô tả cơ sở hạ tầng mong muốn
    - **Providers**: Providers là plugins được Terraform sử dụng để tương tác với các APIs của các dịch vụ đám mây, dịch vụ nền tảng hoặc sản phẩm phần mềm
    - **Resources**: Resources là các thành phần cơ bản của cơ sở hạ tầng, bao gồm, nhưng không giới hạn ở, máy ảo, mạng, và dịch vụ
    - **Terraform CLI**: CLI của Terraform cung cấp các lệnh để quản lý và kiểm soát các hành động của Terraform, bao gồm khởi tạo, áp dụng, và hủy bỏ cơ sở hạ tầng
    - **State Files**: Terraform dùng các tệp trạng thái để lưu trữ thông tin về cơ sở hạ tầng đã được tạo và quản lý
    - **Variables and Outputs**: Variables được sử dụng để tùy chỉnh cấu hình, và outputs được sử dụng để lấy giá trị từ cơ sở hạ tầng đã được tạo
- **Các từ khóa thông dụng trong terraform**:
    - **provider**: Chỉ định nhà cung cấp cloud (AWS, GCP, Azure, ...) và config cơ bản
    - **resource**: Tạo ra resource thật trên cloud
    - **data**: Lấy thông tin từ tài nguyên đã tồn tại trên cloud, không tạo mới
    - **variable**: Tạo biến để tái sử dụng giá trị, dễ thay đổi giữa môi trường
    - **output**: Xuất giá trị ra console hoặc module khác
    - **module**: Gom nhóm resource lại để tái sử dụng
    - **locals**: Khai báo giá trị tạm, giúp code gọn và tránh lặp lại
    - **count / for_each**: Tạo nhiều resource cùng loại mà không phải viết lặp lại
    - **depends_on**: Đảm bảo Terraform tạo resource này sau resource khác
    - **functions / interpolation**: Dùng các hàm built-in (concat, lookup, upper, lower…) hoặc ${} để nhúng giá trị biến, count, output
- **Các bước triển khai terraform**
    - `terraform init`: Chuẩn bị môi trường làm việc bằng cách khởi tạo Terraform
    - `terraform plan`: Xác định và lên kế hoạch những gì sẽ được tạo, thay đổi, hoặc xoá bỏ
    - `terraform apply`: Áp dụng các thay đổi để tạo hoặc chỉnh sửa Infrastructure
    - `terraform destroy`: Xóa bỏ toàn bộ Infra

## Lab-01: Tạo một template Terraform đơn giản và deploy lên AWS
- Chuẩn bị 1 keypair
- Tạo một Terraform template với resource là 1 EC2 instance, 1 Security Group với cấu hình cơ bản
- Chạy lệnh `terraform init`
- Chạy lệnh `terraform plan`
- Chạy lệnh `terraform apply`
- Khi chạy thành công => check trên AWS console sẽ thấy các resource đã được tạo
- Lệnh `terraform destroy`: Xóa resource cho đỡ tốn $$$

## Lab-02: Làm quen với Parameter, Variable file
- Tái sử dụng lại keypair của lab trước
- Viết thêm file variable.tf để khai báo thêm 1 số biến
- Khi này khi chạy lệnh `terraform plan` nó sẽ báo cần điền giá trị cho các biến => rất rắc rối
- => gán giá trị cho 2 biến riêng biệt trong file `terraform.tfvars`
- Chạy lại `terraform plan` => nó ko hỏi nữa

