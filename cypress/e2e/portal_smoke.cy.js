/**
 * Smoke test: verifies the home page loads and key sections are visible.
 */
describe('UCC Portal - Smoke', () => {
  it('loads home page and shows hero and form', () => {
    cy.visit('/');

    // Check response is OK and DOM loaded
    cy.location('pathname').should('match', /^\/?$/);

    // Hero section
    cy.get('.portal__wrapper__hero').should('be.visible');
    cy.get('.portal__wrapper__hero img').should('have.attr', 'src');

    // Form section
    cy.get('form.portal__wrapper__form').should('be.visible');
    cy.get('.portal__wrapper__form__wrapper__title h1')
      .should('contain.text', 'Student')
      .and('contain.text', 'Portal');

    // Main inputs exist
    cy.get('#studno').should('exist');
    cy.get('#acode').should('exist');
    cy.get('#captcha').should('exist');
  });

  it('renders correctly on a small viewport (mobile sanity)', () => {
    cy.viewport(375, 667);
    cy.visit('/');
    cy.get('.portal__wrapper__hero').should('be.visible');
    cy.get('form.portal__wrapper__form').should('be.visible');
  });
});
