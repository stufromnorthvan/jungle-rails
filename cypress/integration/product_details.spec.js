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

  it("Goes to product page when partial is clicked", () => {
    cy.get(".products article")
      .first()
      .click();

    cy.url().should('eq', 'http://127.0.0.1:54829/products/2')
  })
})