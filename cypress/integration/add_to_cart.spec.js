describe('Jungle Rails Home Page', () => {

  it('Visits the home page', () => {
    cy.visit('/')
  })

  //*--------------------------------------------------------------------------*

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  //*--------------------------------------------------------------------------*

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  //*--------------------------------------------------------------------------*

  it("Add to cart button changes to correct quantity when clicked once", () => {
    cy.get(".nav-item").contains("My Cart (0)");
    cy.get("button").contains('Add')
      .first()
      .click({force: true});
    cy.get(".nav-item").contains("My Cart (1)");
  })

})