# from django.test import TestCase
# from products.models import Product

# class ProductModelTest(TestCase):

#     @classmethod
#     def setUpClass(cls):
#         cls.data = {
#             'title': 'T-shirt',
#             'price': 20.00,
#             'cover_image': 'example.jpg',
#             'quantity': '1'
#         }
#         cls.data2 = {
#             'title': 'T-shirt 2',
#             'price': 40.00,
#             'cover_image': 'example.jpg',
#             'quantity': '2'
#         }
#         Product.objects.create(**cls.data)
#         Product.objects.create(**cls.data2)

#         cls.product_info_1 = Product.objects.first()
#         cls.product_info_2 = Product.objects.last()


#     def test_created_data(self):
#         self.assertEqual(self.product_info_1.title, 'T-shirt')
#         self.assertEqual(self.product_info_2.price, self.data2['price'])

#     def test_str_method(self):
#         self.assertEqual(str(self.product_info_1), self.data['title'])
#         self.assertEqual(str(self.product_info_2), self.data2['title'])
    
#     @classmethod
#     def tearDownClass(cls):
#         print('tearDownClass')

