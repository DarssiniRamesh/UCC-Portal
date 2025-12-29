/**
 * Tests password visibility toggle using #show-hide-pass and .js-pass
 */
describe('UCC Portal - Password Toggle', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('toggles password visibility and updates icon', () => {
    cy.get('#acode').as('passInput').should('have.attr', 'type', 'password');
    cy.get('#show-hide-pass').as('toggle').should('exist');

    // Initial icon should be showPass.svg
    cy.get('@toggle').should('have.attr', 'src').and('include', 'showPass.svg');

    // Click toggle -> text + hide icon
    cy.get('@toggle').click();
    cy.get('@passInput').should('have.attr', 'type', 'text');
    cy.get('@toggle').should('have.attr', 'src').and('include', 'hidePass.svg');

    // Click again -> password + show icon
    cy.get('@toggle').click();
    cy.get('@passInput').should('have.attr', 'type', 'password');
    cy.get('@toggle').should('have.attr', 'src').and('include', 'showPass.svg');
  });

  it('toggle is focusable and clickable via keyboard (basic accessibility)', () => {
    cy.get('#show-hide-pass')
      .focus()
      .type('{enter}');
    cy.get('#acode').should('have.attr', 'type', 'text');

    cy.get('#show-hide-pass')
      .type('{enter}');
    cy.get('#acode').should('have.attr', 'type', 'password');
  });
});
