# from django.conf import settings
# from django.test import TestCase
# from django.urls import reverse_lazy

# from products.models import Product


# class ProductViewTest(TestCase):

#     @classmethod
#     def setUpClass(cls):
#         cls.valid_data = {
#             'name': 'Kamal ',
#             'email': 'kamal@gmail.com',
#             'rate': '1',
#             'message': 'Ana sehifeden login sehifesine daxil ola bilmirem'
#         }

#         cls.invalid_data = {
#             'email': 'tmart@gmail.com',
#             'rate': '2',
#             'message': 'Ana sehifeden login sehifesine daxil ola bilmirem'
#         }

#         cls.contact_url = f'/{settings.LANGUAGE_CODE}/product-detail/'

#     def test_url(self):
#         self.assertEqual(self.url, '/shop/')

    # def test_get_request(self):
    #     response = self.client.get(self.contact_url)
    #     self.assertEqual(response.status_code, 200)
    #     self.assertIn('form', response.context)
    #     self.assertTemplateUsed(response, 'contact.html')

    # def test_post_request(self):
    #     response = self.client.post(self.url, self.valid_data)
    #     self.assertEqual(response.status_code, 302)
    #     contact_data = Product.objects.last()
    #     self.assertEqual(self.valid_data['name'], contact_data.name)
    #     self.assertEqual(self.valid_data['email'], contact_data.email)
    #     self.assertEqual(self.valid_data['message'], contact_data.message)
    #     self.assertRedirects(response, f'/{settings.LANGUAGE_CODE}/')

    # def test_post_invalid_request(self):
    #     response = self.client.post(self.url, self.invalid_data)
    #     self.assertEqual(response.status_code, 200)
    #     self.assertContains(response, "Keçərli e-poçt ünvanı daxil edin.", html=True)

    # @classmethod
    # def tearDownClass(cls):
    #     pass
