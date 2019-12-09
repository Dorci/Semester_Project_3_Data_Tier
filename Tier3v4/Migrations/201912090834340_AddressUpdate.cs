namespace Tier3v4.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddressUpdate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Addresses",
                c => new
                    {
                        AddressId = c.Int(nullable: false, identity: true),
                        City = c.String(),
                        StreetName = c.String(),
                        Floor = c.Int(nullable: false),
                        Block = c.String(),
                        Flat = c.String(),
                        BuildingNo = c.Int(nullable: false),
                        PostalCode = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.AddressId);
            
            AddColumn("dbo.Events", "myProperty", c => c.Int(nullable: false));
            AddColumn("dbo.Events", "alcoholicDrink", c => c.Boolean(nullable: false));
            AddColumn("dbo.Events", "startTime", c => c.String());
            AddColumn("dbo.Events", "endTime", c => c.String());
            AddColumn("dbo.Events", "description", c => c.String());
            AddColumn("dbo.Events", "ageLimit", c => c.Int(nullable: false));
            AddColumn("dbo.Events", "pets", c => c.Boolean(nullable: false));
            AddColumn("dbo.Events", "entertainment", c => c.Boolean(nullable: false));
            AddColumn("dbo.Events", "maxNoOfGuests", c => c.Int(nullable: false));
            AddColumn("dbo.Events", "entryFee", c => c.Double(nullable: false));
            AddColumn("dbo.Events", "starter", c => c.String());
            AddColumn("dbo.Events", "mainCourse", c => c.String());
            AddColumn("dbo.Events", "dessert", c => c.String());
            AddColumn("dbo.Events", "addressId_AddressId", c => c.Int());
            AddColumn("dbo.Events", "userId_userID", c => c.Int());
            CreateIndex("dbo.Events", "addressId_AddressId");
            CreateIndex("dbo.Events", "userId_userID");
            AddForeignKey("dbo.Events", "addressId_AddressId", "dbo.Addresses", "AddressId");
            AddForeignKey("dbo.Events", "userId_userID", "dbo.Users", "userID");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Events", "userId_userID", "dbo.Users");
            DropForeignKey("dbo.Events", "addressId_AddressId", "dbo.Addresses");
            DropIndex("dbo.Events", new[] { "userId_userID" });
            DropIndex("dbo.Events", new[] { "addressId_AddressId" });
            DropColumn("dbo.Events", "userId_userID");
            DropColumn("dbo.Events", "addressId_AddressId");
            DropColumn("dbo.Events", "dessert");
            DropColumn("dbo.Events", "mainCourse");
            DropColumn("dbo.Events", "starter");
            DropColumn("dbo.Events", "entryFee");
            DropColumn("dbo.Events", "maxNoOfGuests");
            DropColumn("dbo.Events", "entertainment");
            DropColumn("dbo.Events", "pets");
            DropColumn("dbo.Events", "ageLimit");
            DropColumn("dbo.Events", "description");
            DropColumn("dbo.Events", "endTime");
            DropColumn("dbo.Events", "startTime");
            DropColumn("dbo.Events", "alcoholicDrink");
            DropColumn("dbo.Events", "myProperty");
            DropTable("dbo.Addresses");
        }
    }
}
