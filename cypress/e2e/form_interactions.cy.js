/**
 * Tests for floating label behavior and basic required validation.
 * The current DOM uses .focus class on parent (.portal__wrapper__form__wrapper__field__input)
 * when the input is focused or has a value; it is removed when blurred empty.
 */
describe('UCC Portal - Form Interactions', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  const parentSelector = '.portal__wrapper__form__wrapper__field__input';

  it('floating label focus/blur behavior for Student Number', () => {
    cy.get('#studno')
      .as('studno')
      .should('exist')
      .focus()
      .closest(parentSelector)
      .should('have.class', 'focus');

    cy.get('@studno')
      .blur()
      .closest(parentSelector)
      .should('not.have.class', 'focus');

    cy.get('@studno')
      .type('2023-00001')
      .closest(parentSelector)
      .should('have.class', 'focus');

    // After typing, blur should retain focus state
    cy.get('@studno')
      .blur()
      .closest(parentSelector)
      .should('have.class', 'focus');
  });

  it('floating label behavior for Access Code', () => {
    cy.get('#acode')
      .as('acode')
      .focus()
      .closest(parentSelector)
      .should('have.class', 'focus');

    cy.get('@acode')
      .blur()
      .closest(parentSelector)
      .should('not.have.class', 'focus');

    cy.get('@acode')
      .type('secret')
      .closest(parentSelector)
      .should('have.class', 'focus');

    cy.get('@acode')
      .blur()
      .closest(parentSelector)
      .should('have.class', 'focus');
  });

  it('basic required validation: submit with empty fields should not navigate', () => {
    // The form doesn't have required attributes or a real action,
    // but clicking the button should not navigate away.
    cy.url().as('startUrl');
    cy.get('.portal__wrapper__form__wrapper__field__button button')
      .click();

    cy.get('@startUrl').then((startUrl) => {
      cy.url().should('eq', startUrl);
    });
  });
});
