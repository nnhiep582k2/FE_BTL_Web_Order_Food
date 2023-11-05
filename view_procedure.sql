
-- view
CREATE or ALTER VIEW [dbo].[ViewFood]
AS
SELECT dbo.Categorys.Name, dbo.Categorys.CategoryId, dbo.Foods.FoodId, dbo.Foods.FoodName, dbo.Foods.Price, dbo.Foods.Quantity, dbo.Foods.CreatedDate, dbo.Foods.CreatedBy, dbo.Foods.ModifiedDate, dbo.Foods.ModifiedBy, 
                  dbo.Foods.FoodDesc, dbo.Foods.FoodDiscount, dbo.Foods.FoodStar, dbo.Foods.FoodType, dbo.Foods.FoodStatus, dbo.Foods.FoodVote, dbo.FoodImages.Url
FROM     dbo.Categorys INNER JOIN
                  dbo.Foods ON dbo.Categorys.CategoryId = dbo.Foods.CategoryId INNER JOIN
                  dbo.FoodImages ON dbo.Foods.FoodId = dbo.FoodImages.FoodId

CREATE or ALTER VIEW [dbo].[ViewCategory]
AS
SELECT dbo.Categorys.*
FROM     dbo.Categorys

CREATE or ALTER VIEW [dbo].[ViewBill]
AS
SELECT dbo.Bills.CreatedDate, dbo.Bills.Total, dbo.Bills.Status, dbo.Bills.UserId, dbo.Bills.BillId, dbo.Users.Username, dbo.Users.Address, dbo.Users.Avatar, dbo.Users.FullName, dbo.Users.PhoneNumber
FROM     dbo.Bills INNER JOIN
                  dbo.Users ON dbo.Bills.UserId = dbo.Users.UserId



CREATE or ALTER VIEW [dbo].[ViewRole]
AS
SELECT dbo.Roles.*
FROM     dbo.Roles

CREATE or ALTER VIEW [dbo].[ViewUser]
AS
SELECT dbo.Users.*
FROM     dbo.Users

CREATE or ALTER VIEW [dbo].[ViewOrder]
AS
SELECT dbo.Orders.*
FROM     dbo.Orders

CREATE VIEW [dbo].[ViewFoodImage]
AS
SELECT dbo.FoodImages.*
FROM     dbo.FoodImages


CREATE VIEW [dbo].[ViewFoodImage]
AS
SELECT dbo.FoodImages.*
FROM     dbo.FoodImages

-- PROCEDURE


-- CRUD bill

CREATE or ALTER PROCEDURE GetBills
    @Id uniqueidentifier
AS
BEGIN
   SELECT b.BillId,b.Paid,b.Status,b.CreatedDate,b.Total,u.Address, u.PhoneNumber  
	FROM Bills b inner join Users u on u.UserId= b.UserId
	WHERE b.UserId = @Id
END

CREATE or ALTER PROCEDURE GetBillDetails
    @Id uniqueidentifier
AS
BEGIN
   SELECT f.FoodId,f.FoodDesc, fi.Url, f.FoodName, bd.Quantity
   from BillDetails bd 
	 inner join Foods f on f.FoodId = bd.FoodId
	 left join FoodImages fi on fi.FoodId = f.FoodId
	WHERE bd.BillId = @Id
END

CREATE or ALTER PROCEDURE GetBillStatus
    @Id uniqueidentifier
AS
BEGIN
   SELECT b.BillId, b.Discount,b.Delivery,b.Total
   from Bills b
	WHERE b.BillId = @Id
END


CREATE or alter PROCEDURE AddBill
	@BillId uniqueidentifier,
    @UserId uniqueidentifier,
    @Paid NVARCHAR(50) = null,
	@Status int,
	@Total int,
	@Method NVARCHAR(50) = null,
	@Discount int = null,
	@Delivery int = null,
	@CreatedDate datetime2(7),
	@CreatedBy nvarchar(max),
	@ModifiedDate datetime2(7),
	@ModifiedBy  nvarchar(max)
AS
BEGIN
    
INSERT INTO [dbo].[Bills] ([BillId],[UserId],[Status],[Total],[CreatedDate],[CreatedBy],[ModifiedDate],[ModifiedBy],[Delivery],[Discount],[Method],[Paid])
     VALUES
           (@BillId,@userId,@status,@total,GETDATE() ,'NTKIEN',null,null,@delivery,@discount,@method,@Paid)
END



CREATE or ALTER PROCEDURE UpdateBill
    @BillId uniqueidentifier,
    @UserId uniqueidentifier,
    @Paid NVARCHAR(50) = null,
	@Status int,
	@Total int,
	@Method NVARCHAR(50) = null,
	@Discount int = null,
	@Delivery int = null,
	@CreatedDate datetime2(7),
	@CreatedBy nvarchar(max),
	@ModifiedDate datetime2(7),
	@ModifiedBy  nvarchar(max)
AS
BEGIN
    UPDATE Bills
    SET
        UserId = @UserId,
        Paid = @Paid,
		Status = @Status,
		Total = @Total,
		Method = @Method,
		Discount = @Discount,
		Delivery = @Delivery,
		ModifiedDate = GETDATE(),
		ModifiedBy = 'NTKIEN'
    WHERE
        BillId = @BillId;
END;


-- CRUD Category
CREATE or alter PROCEDURE AddCategory
	@CategoryId uniqueidentifier,
    @Name NVARCHAR(max),
	@CreatedDate datetime2(7),
	@CreatedBy nvarchar(max),
	@ModifiedDate datetime2(7),
	@ModifiedBy  nvarchar(max)
AS
BEGIN
INSERT INTO Categorys(CategoryId,Name,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
     VALUES
           (@CategoryId,@Name, GETDATE(),'NTKIEN',null,null)
END

-- update
CREATE or ALTER PROCEDURE UpdateCategory
	@CategoryId uniqueidentifier,
    @Name NVARCHAR(max),
	@CreatedDate datetime2(7),
	@CreatedBy nvarchar(max),
	@ModifiedDate datetime2(7),
	@ModifiedBy  nvarchar(max)
AS
BEGIN
    UPDATE Categorys
    SET
        Name = @Name,
		ModifiedDate = GETDATE(),
		ModifiedBy = 'NTKIEN'
    WHERE
        CategoryId = @CategoryId;
END;

-- get by id
CREATE or ALTER PROCEDURE GetCategorys
    @Id uniqueidentifier
AS
BEGIN
   SELECT *  
	FROM Categorys c
	WHERE c.CategoryId = @Id
END



-- CRUD role
CREATE or alter PROCEDURE AddRole
	@RoleId uniqueidentifier,
    @RoleName NVARCHAR(max),
	@CreatedDate datetime2(7),
	@CreatedBy nvarchar(max),
	@ModifiedDate datetime2(7),
	@ModifiedBy  nvarchar(max)
AS
BEGIN
INSERT INTO Roles(RoleId,RoleName,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
     VALUES
           (@RoleId,@RoleName, GETDATE(),'NTKIEN',null,null)
END

-- update
CREATE or ALTER PROCEDURE UpdateRole
	@RoleId uniqueidentifier,
    @RoleName NVARCHAR(max),
	@CreatedDate datetime2(7),
	@CreatedBy nvarchar(max),
	@ModifiedDate datetime2(7),
	@ModifiedBy  nvarchar(max)
AS
BEGIN
    UPDATE Roles
    SET
        RoleName = @RoleName,
		ModifiedDate = GETDATE(),
		ModifiedBy = 'NTKIEN'
    WHERE
        RoleId = @RoleId;
END;

-- get by id
CREATE or ALTER PROCEDURE GetRoles
    @Id uniqueidentifier
AS
BEGIN
   SELECT *  
	FROM Roles r
	WHERE r.RoleId = @Id
END



-- CRUD Order
CREATE or alter PROCEDURE AddOrder
	@OrderId uniqueidentifier,
	@UserId uniqueidentifier,
    @PickupDate datetime2(7),
	@CreatedDate datetime2(7),
	@CreatedBy nvarchar(max),
	@ModifiedDate datetime2(7),
	@ModifiedBy  nvarchar(max)
AS
BEGIN
INSERT INTO Orders(OrderId,UserId,PickupDate,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
     VALUES
           (@OrderId,@UserId,@PickupDate, GETDATE(),'NTKIEN',null,null)
END

-- update
CREATE or ALTER PROCEDURE UpdateOrder
	@OrderId uniqueidentifier,
	@UserId uniqueidentifier,
    @PickupDate datetime2(7),
	@CreatedDate datetime2(7),
	@CreatedBy nvarchar(max),
	@ModifiedDate datetime2(7),
	@ModifiedBy  nvarchar(max)
AS
BEGIN
    UPDATE Orders
    SET
		UserId = @UserId,
        PickupDate = @PickupDate,
		ModifiedDate = GETDATE(),
		ModifiedBy = 'NTKIEN'
    WHERE
        OrderId = @OrderId;
END;

-- get by id
CREATE or ALTER PROCEDURE GetOrders
    @Id uniqueidentifier
AS
BEGIN
   SELECT *  
	FROM Orders o
	WHERE o.OrderId = @Id
END


-- CRUD User

/*
{
  "fullName": "kien",
  "username": "kren",
  "passwordHash": "123456789@",
  "email": "string",
  "phoneNumber": "849309234",
  "address": "string",
  "avatar": "string",
  "gender": 0,
  "roleId": "BFE39821-2BA0-4902-9186-5DDABCB98221"
}
*/
CREATE or alter PROCEDURE AddUser
	@UserId uniqueidentifier,
	@FullName nvarchar(max),
	@Username nvarchar(max),
	@PasswordHash nvarchar(max),
	@Email nvarchar(max),
	@PhoneNumber nvarchar(max),
	@Address nvarchar(max),
	@Avatar nvarchar(max),
	@Gender int,
	@RoleId uniqueidentifier,
	@CreatedDate datetime2(7),
	@CreatedBy nvarchar(max),
	@ModifiedDate datetime2(7),
	@ModifiedBy  nvarchar(max)
AS
BEGIN
INSERT INTO Users(UserId,FullName,Username, PasswordHash,Email,PhoneNumber,Address, Avatar, Gender, RoleId,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
     VALUES
           (@UserId,@FullName,@Username,@PasswordHash,@Email,@PhoneNumber,@Address,@Avatar,@Gender,@RoleId, GETDATE(),'NTKIEN',null,null)
END

-- update
CREATE or ALTER PROCEDURE UpdateUser
	@UserId uniqueidentifier,
	@FullName nvarchar(max),
	@Username nvarchar(max),
	@PasswordHash nvarchar(max),
	@Email nvarchar(max),
	@PhoneNumber nvarchar(max),
	@Address nvarchar(max) = null,
	@Avatar nvarchar(max) = null,
	@Gender int = null,
	@RoleId uniqueidentifier,
	@CreatedDate datetime2(7),
	@CreatedBy nvarchar(max),
	@ModifiedDate datetime2(7),
	@ModifiedBy  nvarchar(max)
AS
BEGIN
    UPDATE Users
    SET
        FullName = @FullName,
		Username = @Username,
		Email = @Email,
		PhoneNumber = @PhoneNumber,
		Address = @Address,
		Avatar = @Avatar, 
		Gender = @Gender, 
		RoleId = @RoleId,
		ModifiedDate = GETDATE(),
		ModifiedBy = 'NTKIEN'
    WHERE
        UserId = @UserId;
END;

-- get by id
CREATE or ALTER PROCEDURE GetUsers
    @Id uniqueidentifier
AS
BEGIN
   SELECT *  
	FROM Users u
	WHERE u.UserId = @Id
END


-- CRUD food image
CREATE or alter PROCEDURE AddFoodImage
	@FoodImageId uniqueidentifier,
	@FoodId uniqueidentifier,
	@Url nvarchar(max),
	@Type int = null,
	@CreatedDate datetime2(7),
	@CreatedBy nvarchar(max),
	@ModifiedDate datetime2(7),
	@ModifiedBy  nvarchar(max)
AS
BEGIN
INSERT INTO FoodImages(FoodImageId,FoodId,Url,Type,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy)
     VALUES
           (@FoodImageId,@FoodId,@Url,@Type, GETDATE(),'NTKIEN',null,null)
END

-- update
CREATE or ALTER PROCEDURE UpdateFoodImage
	@FoodImageId uniqueidentifier,
	@FoodId uniqueidentifier,
	@Url nvarchar(max),
	@Type int = null,
	@CreatedDate datetime2(7),
	@CreatedBy nvarchar(max),
	@ModifiedDate datetime2(7),
	@ModifiedBy  nvarchar(max)
AS
BEGIN
    UPDATE FoodImages
    SET
        FoodId = @FoodId,
		Url = @Url,
		Type = @Type,
		ModifiedDate = GETDATE(),
		ModifiedBy = 'NTKIEN'
    WHERE
        FoodImageId = @FoodImageId;
END;

-- get by id
CREATE or ALTER PROCEDURE GetFoodImages
    @Id uniqueidentifier
AS
BEGIN
   SELECT *  
	FROM FoodImages f
	WHERE f.FoodImageId = @Id
END

