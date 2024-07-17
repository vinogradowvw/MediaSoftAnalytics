# Функция редактирования заказа

## Общая информация

### Аудитория
Данный документ предназначен для постановки задачи разработки и дальнейшей передачи команде разработи для выполнения.

### Решаемая задача
В приложении "Частная пекарня" необходимо релаизовать функцию редактирования заказа, для предоставления возможности это сделать прользователям.

## Бизнес-требования и приоритеты
| As a         | I want                     | SO that                                                      | Приоритет требования |
|--------------|----------------------------|--------------------------------------------------------------|----------------------|
| Пользователь | Изменить состав заказа     | Для добавления / удаления нужных / ненужных товаров в заказ  | Высокий              |
| Пользователь | Изменить количество товара | Для корректировки количества заказанных товаров               | Высокий              |

## Критерии качества на входе (DoR)

1. **Полное описание задачи**
   - Задача должна содержать полное и четкое описание всех аспектов функции редактирования заказа.

2. **Понимание требований**
   - Вся команда разработчиков должна понимать бизнес-требования и приоритеты.
   - Должны быть проведены все необходимые обсуждения и уточнения с владельцем продукта или заказчиком.

3. **Документированные API спецификации**
   - Должны быть подготовлены и согласованы спецификации API для всех необходимых эндпоинтов, включая запросы и ответы.

4. **Проектирование пользовательского интерфейса**
   - Должны быть подготовлены и утверждены макеты пользовательского интерфейса для функции редактирования заказа.

5. **Определение данных для тестирования**
   - Должен быть составлен список данных для тестирования, включая как положительные, так и отрицательные сценарии.

6. **Технические ограничения и зависимости**
   - Все технические ограничения и зависимости должны быть выявлены и задокументированы.

7. **Готовность инфраструктуры**
   - Должна быть готова вся необходимая инфраструктура, включая базы данных, серверы и сервисы для интеграции.

## Acceptance Criteria

1. **Добавление товаров в заказ**
   - Пользователь может добавлять новые товары в текущий заказ.
   - После добавления товаров в заказ общая сумма заказа должна корректно обновляться и отображаться пользователю.
   - Пользователь получает уведомление о том, что товары успешно добавлены в заказ.

2. **Удаление товаров из заказа**
   - Пользователь может удалять товары из текущего заказа.
   - После удаления товаров из заказа общая сумма заказа должна корректно обновляться и отображаться пользователю.
   - Пользователь получает уведомление о том, что товары успешно удалены из заказа.

3. **Изменение количества товаров в заказе**
   - Пользователь может изменять количество любого товара в заказе.
   - После изменения количества товаров общая сумма заказа должна корректно обновляться и отображаться пользователю.
   - Пользователь получает уведомление о том, что количество товаров успешно изменено.

4. **Просмотр обновленного заказа**
   - Пользователь может просматривать текущий состав заказа, включая наименования товаров, их количество и общую стоимость.
   - Все изменения в составе заказа должны быть немедленно отражены в интерфейсе пользователя.

## Функциональные требования

| Номер требования | Описание требования |
|------------------|---------------------|
| FR-1 | **Просмотр текущего заказа:** Пользователь должен иметь возможность запросить информацию о текущем активном заказе. Система должна возвращать данные о товарах, добавленных в текущий заказ, включая их количество, цену и общую стоимость заказа. |
| FR-2 | **Добавление новых товаров в заказ:** Пользователь должен иметь возможность запросить список доступных товаров. Пользователь должен иметь возможность добавить выбранные товары в текущий заказ. Система должна обновить данные заказа в базе данных, добавив выбранные товары. |
| FR-3 | **Удаление товаров из заказа:** Пользователь должен иметь возможность выбрать товары для удаления из текущего заказа. Система должна обновить данные заказа в базе данных, удалив выбранные товары. |
| FR-4 | **Перерасчет стоимости заказа:** После каждого изменения состава заказа (добавления или удаления товаров), система должна автоматически пересчитать общую стоимость заказа. Система должна учитывать уже оплаченные суммы и корректировать итоговую сумму для оплаты или возврата. |
| FR-5 | **Оплата/возврат заказа:** Пользователь должен иметь возможность перейти к оплате измененного заказа или запросить возврат средств при отмене заказа. Система должна перенаправить пользователя на платежный шлюз для ввода данных для оплаты или возврата. В случае успешной оплаты, система должна подтвердить оплату и сообщить пользователю примерное время ожидания. |
| FR-6 | **Подтверждение оплаты и обновление заказа:** При успешной оплате система должна отправить подтверждение оплаты в бекенд для обновления статуса заказа. Система должна уведомить пользователя о подтверждении заказа и предоставить информацию о примерном времени ожидания. |


## Модель процесса

## Интерфейс

https://www.figma.com/design/uNCFKCbtjze5l5tvMceMb1/%D0%A7%D0%B0%D1%81%D1%82%D0%BD%D0%B0%D1%8F-%D0%BF%D0%B5%D0%BA%D0%B0%D1%80%D0%BD%D1%8F?node-id=0-1&t=6QYEamfx0JOyDaPD-1

### Sequence диаграмма


## API запросы в спецификации OpenAPI

```yaml
openapi: 3.1.0
info:
  title: Bakery Order API
  description: API for managing bakery orders
  version: 1.0.0
servers:
  - url: https://api.example.com/v1
paths:
  /order/active/user/{userId}:
    get:
      summary: Get active order for user
      parameters:
        - name: userId
          in: path
          required: true
          schema:
            type: integer
          description: ID of the user
      responses:
        '200':
          description: Active order details
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Order'
  /bakery/{bakeryId}/menu:
    get:
      summary: Get bakery menu
      parameters:
        - name: bakeryId
          in: path
          required: true
          schema:
            type: integer
          description: ID of the bakery
      responses:
        '200':
          description: List of available products
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Product'
  /order/{orderId}/products:
    patch:
      summary: Add products to order
      parameters:
        - name: orderId
          in: path
          required: true
          schema:
            type: integer
          description: ID of the order
        - name: ids
          in: query
          required: true
          schema:
            type: string
          description: Comma-separated list of product IDs
      requestBody:
        content:
          application/json:
            schema:
              type: array
              items:
                $ref: '#/components/schemas/OrderItem'
      responses:
        '200':
          description: Updated order details
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Order'
    delete:
      summary: Remove products from order
      parameters:
        - name: orderId
          in: path
          required: true
          schema:
            type: integer
          description: ID of the order
        - name: ids
          in: query
          required: true
          schema:
            type: string
          description: Comma-separated list of product IDs
      responses:
        '200':
          description: Updated order details
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/Order'
  /order/{orderId}:
    delete:
      summary: Cancel order
      parameters:
        - name: orderId
          in: path
          required: true
          schema:
            type: integer
          description: ID of the order
      responses:
        '200':
          description: Order cancellation confirmation
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/OrderCancellation'
  /payment/user/{userId}/initiate:
    post:
      summary: Initiate payment
      parameters:
        - name: userId
          in: path
          required: true
          schema:
            type: integer
          description: ID of the user
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/PaymentRequest'
      responses:
        '200':
          description: Payment initiation response
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/PaymentResponse'
components:
  schemas:
    Order:
      type: object
      properties:
        id:
          type: integer
        userId:
          type: integer
        status:
          type: string
        items:
          type: array
          items:
            $ref: '#/components/schemas/OrderItem'
    Product:
      type: object
      properties:
        id:
          type: integer
        name:
          type: string
        price:
          type: number
          format: float
    OrderItem:
      type: object
      properties:
        productId:
          type: integer
        quantity:
          type: integer
    OrderCancellation:
      type: object
      properties:
        orderId:
          type: integer
        status:
          type: string
          enum:
            - cancelled
    PaymentRequest:
      type: object
      properties:
        orderId:
          type: integer
        amount:
          type: number
          format: float
    PaymentResponse:
      type: object
      properties:
        paymentUrl:
          type: string
```

### ER-модель
https://dbdesigner.page.link/xAsD1Z52GchGu28d6
