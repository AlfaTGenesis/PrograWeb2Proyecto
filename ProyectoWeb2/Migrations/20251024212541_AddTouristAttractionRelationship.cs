using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ProyectoWeb2.Migrations
{
    /// <inheritdoc />
    public partial class AddTouristAttractionRelationship : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "City",
                table: "TouristAttractions");

            migrationBuilder.AddColumn<int>(
                name: "StadiumId",
                table: "TouristAttractions",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "Type",
                table: "TouristAttractions",
                type: "varchar(50)",
                maxLength: 50,
                nullable: false,
                defaultValue: "")
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "IX_TouristAttractions_StadiumId",
                table: "TouristAttractions",
                column: "StadiumId");

            migrationBuilder.AddForeignKey(
                name: "FK_TouristAttractions_Stadiums_StadiumId",
                table: "TouristAttractions",
                column: "StadiumId",
                principalTable: "Stadiums",
                principalColumn: "StadiumId",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TouristAttractions_Stadiums_StadiumId",
                table: "TouristAttractions");

            migrationBuilder.DropIndex(
                name: "IX_TouristAttractions_StadiumId",
                table: "TouristAttractions");

            migrationBuilder.DropColumn(
                name: "StadiumId",
                table: "TouristAttractions");

            migrationBuilder.DropColumn(
                name: "Type",
                table: "TouristAttractions");

            migrationBuilder.AddColumn<string>(
                name: "City",
                table: "TouristAttractions",
                type: "varchar(100)",
                maxLength: 100,
                nullable: false,
                defaultValue: "")
                .Annotation("MySql:CharSet", "utf8mb4");
        }
    }
}
