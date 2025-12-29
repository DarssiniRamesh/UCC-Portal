/**
 * Tests captcha image visibility behavior:
 * - Hidden by default
 * - Visible on focus of input
 * - Hides on blur when empty
 * - Remains visible when input has value
 */
describe('UCC Portal - Captcha Visibility', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('captcha image visibility toggles based on focus/value', () => {
    const parentSelector = '.portal__wrapper__form__wrapper__field__input';

    cy.get('#captcha-img')
      .should('exist')
      .should('be.hidden'); // uses CSS visibility/opacity, Cypress infers as hidden

    cy.get('#captcha')
      .as('captchaInput')
      .focus()
      .closest(parentSelector)
      .should('have.class', 'focus');

    cy.get('#captcha-img').should('be.visible');

    // Blur with empty value -> should hide again
    cy.get('@captchaInput')
      .blur()
      .closest(parentSelector)
      .should('not.have.class', 'focus');

    cy.get('#captcha-img').should('not.be.visible');

    // Type a value -> remains visible even after blur
    cy.get('@captchaInput').type('1234').closest(parentSelector).should('have.class', 'focus');
    cy.get('#captcha-img').should('be.visible');

    cy.get('@captchaInput').blur();
    cy.get('#captcha-img').should('be.visible');
  });
});
