# WARNING ABOUT GENERATED CODE
#
# The AWS SDK for Ruby is largely generated from JSON service definitions. Edits
# made against this file will be lost the next time the SDK updates.  To resolve
# an issue with generated code, a change is likely needed in the generator or
# in one of the service JSON definitions.
#
# * https://github.com/aws/aws-sdk-ruby/tree/master/gems/aws-sdk-code-generator
# * https://github.com/aws/aws-sdk-ruby/tree/master/apis
#
# Open a GitHub issue if you have questions before making changes.  Pull
# requests against this file will be automatically closed.
#
# WARNING ABOUT GENERATED CODE
module Aws
  module SimpleDB
    class Client < Seahorse::Client::Base

      include Aws::ClientStubs
      include Aws::ClientWaiters

      @identifier = :simpledb

      set_api(ClientApi::API)

      add_plugin(Seahorse::Client::Plugins::ContentLength)
      add_plugin(Aws::Plugins::Logging)
      add_plugin(Aws::Plugins::ParamConverter)
      add_plugin(Aws::Plugins::ParamValidator)
      add_plugin(Aws::Plugins::UserAgent)
      add_plugin(Aws::Plugins::RetryErrors)
      add_plugin(Aws::Plugins::GlobalConfiguration)
      add_plugin(Aws::Plugins::RegionalEndpoint)
      add_plugin(Aws::Plugins::RequestSigner)
      add_plugin(Aws::Plugins::ResponsePaging)
      add_plugin(Aws::Plugins::StubResponses)
      add_plugin(Aws::Plugins::Protocols::Query)

      # @!group API Operations

      # Performs multiple DeleteAttributes operations in a single call, which
      # reduces round trips and latencies. This enables Amazon SimpleDB to
      # optimize requests, which generally yields better throughput.
      #
      # The following limitations are enforced for this operation: * 1 MB
      # request size
      # * 25 item limit per BatchDeleteAttributes operation
      # @option params [required, String] :domain_name
      #   The name of the domain in which the attributes are being deleted.
      # @option params [required, Array<Types::DeletableItem>] :items
      #   A list of items on which to perform the operation.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.batch_delete_attributes({
      #     domain_name: "String", # required
      #     items: [ # required
      #       {
      #         name: "String", # required
      #         attributes: [
      #           {
      #             name: "String", # required
      #             alternate_name_encoding: "String",
      #             value: "String", # required
      #             alternate_value_encoding: "String",
      #           },
      #         ],
      #       },
      #     ],
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def batch_delete_attributes(params = {}, options = {})
        req = build_request(:batch_delete_attributes, params)
        req.send_request(options)
      end

      # The `BatchPutAttributes` operation creates or replaces attributes
      # within one or more items. By using this operation, the client can
      # perform multiple PutAttribute operation with a single call. This helps
      # yield savings in round trips and latencies, enabling Amazon SimpleDB
      # to optimize requests and generally produce better throughput.
      #
      # The client may specify the item name with the `Item.X.ItemName`
      # parameter. The client may specify new attributes using a combination
      # of the `Item.X.Attribute.Y.Name` and `Item.X.Attribute.Y.Value`
      # parameters. The client may specify the first attribute for the first
      # item using the parameters `Item.0.Attribute.0.Name` and
      # `Item.0.Attribute.0.Value`, and for the second attribute for the first
      # item by the parameters `Item.0.Attribute.1.Name` and
      # `Item.0.Attribute.1.Value`, and so on.
      #
      # Attributes are uniquely identified within an item by their name/value
      # combination. For example, a single item can have the attributes `\{
      # "first_name", "first_value" \}` and `\{ "first_name", "second_value"
      # \}`. However, it cannot have two attribute instances where both the
      # `Item.X.Attribute.Y.Name` and `Item.X.Attribute.Y.Value` are the same.
      #
      # Optionally, the requester can supply the `Replace` parameter for each
      # individual value. Setting this value to `true` will cause the new
      # attribute values to replace the existing attribute values. For
      # example, if an item `I` has the attributes `\{ 'a', '1' \}, \{ 'b',
      # '2'\}` and `\{ 'b', '3' \}` and the requester does a
      # BatchPutAttributes of `\{'I', 'b', '4' \}` with the Replace parameter
      # set to true, the final attributes of the item will be `\{ 'a', '1' \}`
      # and `\{ 'b', '4' \}`, replacing the previous values of the \'b\'
      # attribute with the new value.
      #
      # <important> This operation is vulnerable to exceeding the maximum URL size when making a REST request using the HTTP GET method. This operation does not support conditions using `Expected.X.Name`, `Expected.X.Value`, or `Expected.X.Exists`. </important>
      #
      # You can execute multiple `BatchPutAttributes` operations and other
      # operations in parallel. However, large numbers of concurrent
      # `BatchPutAttributes` calls can result in Service Unavailable (503)
      # responses.
      #
      # The following limitations are enforced for this operation: * 256
      # attribute name-value pairs per item
      # * 1 MB request size
      # * 1 billion attributes per domain
      # * 10 GB of total user data storage per domain
      # * 25 item limit per `BatchPutAttributes` operation
      # @option params [required, String] :domain_name
      #   The name of the domain in which the attributes are being stored.
      # @option params [required, Array<Types::ReplaceableItem>] :items
      #   A list of items on which to perform the operation.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.batch_put_attributes({
      #     domain_name: "String", # required
      #     items: [ # required
      #       {
      #         name: "String", # required
      #         attributes: [ # required
      #           {
      #             name: "String", # required
      #             value: "String", # required
      #             replace: false,
      #           },
      #         ],
      #       },
      #     ],
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def batch_put_attributes(params = {}, options = {})
        req = build_request(:batch_put_attributes, params)
        req.send_request(options)
      end

      # The `CreateDomain` operation creates a new domain. The domain name
      # should be unique among the domains associated with the Access Key ID
      # provided in the request. The `CreateDomain` operation may take 10 or
      # more seconds to complete.
      #
      # The client can create up to 100 domains per account.
      #
      # If the client requires additional domains, go to [
      # http://aws.amazon.com/contact-us/simpledb-limit-request/][1].
      #
      #
      #
      # [1]: http://aws.amazon.com/contact-us/simpledb-limit-request/
      # @option params [required, String] :domain_name
      #   The name of the domain to create. The name can range between 3 and 255
      #   characters and can contain the following characters: a-z, A-Z, 0-9,
      #   \'\_\', \'-\', and \'.\'.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.create_domain({
      #     domain_name: "String", # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def create_domain(params = {}, options = {})
        req = build_request(:create_domain, params)
        req.send_request(options)
      end

      # Deletes one or more attributes associated with an item. If all
      # attributes of the item are deleted, the item is deleted.
      #
      # `DeleteAttributes` is an idempotent operation; running it multiple
      # times on the same item or attribute does not result in an error
      # response.
      #
      # Because Amazon SimpleDB makes multiple copies of item data and uses an
      # eventual consistency update model, performing a GetAttributes or
      # Select operation (read) immediately after a `DeleteAttributes` or
      # PutAttributes operation (write) might not return updated item data.
      # @option params [required, String] :domain_name
      #   The name of the domain in which to perform the operation.
      # @option params [required, String] :item_name
      #   The name of the item. Similar to rows on a spreadsheet, items
      #   represent individual objects that contain one or more value-attribute
      #   pairs.
      # @option params [Array<Types::Attribute>] :attributes
      #   A list of Attributes. Similar to columns on a spreadsheet, attributes
      #   represent categories of data that can be assigned to items.
      # @option params [Types::UpdateCondition] :expected
      #   The update condition which, if specified, determines whether the
      #   specified attributes will be deleted or not. The update condition must
      #   be satisfied in order for this request to be processed and the
      #   attributes to be deleted.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_attributes({
      #     domain_name: "String", # required
      #     item_name: "String", # required
      #     attributes: [
      #       {
      #         name: "String", # required
      #         alternate_name_encoding: "String",
      #         value: "String", # required
      #         alternate_value_encoding: "String",
      #       },
      #     ],
      #     expected: {
      #       name: "String",
      #       value: "String",
      #       exists: false,
      #     },
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def delete_attributes(params = {}, options = {})
        req = build_request(:delete_attributes, params)
        req.send_request(options)
      end

      # The `DeleteDomain` operation deletes a domain. Any items (and their
      # attributes) in the domain are deleted as well. The `DeleteDomain`
      # operation might take 10 or more seconds to complete.
      # @option params [required, String] :domain_name
      #   The name of the domain to delete.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_domain({
      #     domain_name: "String", # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def delete_domain(params = {}, options = {})
        req = build_request(:delete_domain, params)
        req.send_request(options)
      end

      # Returns information about the domain, including when the domain was
      # created, the number of items and attributes in the domain, and the
      # size of the attribute names and values.
      # @option params [required, String] :domain_name
      #   The name of the domain for which to display the metadata of.
      # @return [Types::DomainMetadataResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DomainMetadataResult#item_count #ItemCount} => Integer
      #   * {Types::DomainMetadataResult#item_names_size_bytes #ItemNamesSizeBytes} => Integer
      #   * {Types::DomainMetadataResult#attribute_name_count #AttributeNameCount} => Integer
      #   * {Types::DomainMetadataResult#attribute_names_size_bytes #AttributeNamesSizeBytes} => Integer
      #   * {Types::DomainMetadataResult#attribute_value_count #AttributeValueCount} => Integer
      #   * {Types::DomainMetadataResult#attribute_values_size_bytes #AttributeValuesSizeBytes} => Integer
      #   * {Types::DomainMetadataResult#timestamp #Timestamp} => Integer
      #
      # @example Request syntax with placeholder values
      #   resp = client.domain_metadata({
      #     domain_name: "String", # required
      #   })
      #
      # @example Response structure
      #   resp.item_count #=> Integer
      #   resp.item_names_size_bytes #=> Integer
      #   resp.attribute_name_count #=> Integer
      #   resp.attribute_names_size_bytes #=> Integer
      #   resp.attribute_value_count #=> Integer
      #   resp.attribute_values_size_bytes #=> Integer
      #   resp.timestamp #=> Integer
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def domain_metadata(params = {}, options = {})
        req = build_request(:domain_metadata, params)
        req.send_request(options)
      end

      # Returns all of the attributes associated with the specified item.
      # Optionally, the attributes returned can be limited to one or more
      # attributes by specifying an attribute name parameter.
      #
      # If the item does not exist on the replica that was accessed for this
      # operation, an empty set is returned. The system does not return an
      # error as it cannot guarantee the item does not exist on other
      # replicas.
      # @option params [required, String] :domain_name
      #   The name of the domain in which to perform the operation.
      # @option params [required, String] :item_name
      #   The name of the item.
      # @option params [Array<String>] :attribute_names
      #   The names of the attributes.
      # @option params [Boolean] :consistent_read
      #   Determines whether or not strong consistency should be enforced when data is read from SimpleDB. If `true`, any data previously written to SimpleDB will be returned. Otherwise, results will be consistent eventually, and the client may not see data that was written immediately before your read.
      # @return [Types::GetAttributesResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::GetAttributesResult#attributes #Attributes} => Array&lt;Types::Attribute&gt;
      #
      # @example Request syntax with placeholder values
      #   resp = client.get_attributes({
      #     domain_name: "String", # required
      #     item_name: "String", # required
      #     attribute_names: ["String"],
      #     consistent_read: false,
      #   })
      #
      # @example Response structure
      #   resp.attributes #=> Array
      #   resp.attributes[0].name #=> String
      #   resp.attributes[0].alternate_name_encoding #=> String
      #   resp.attributes[0].value #=> String
      #   resp.attributes[0].alternate_value_encoding #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def get_attributes(params = {}, options = {})
        req = build_request(:get_attributes, params)
        req.send_request(options)
      end

      # The `ListDomains` operation lists all domains associated with the
      # Access Key ID. It returns domain names up to the limit set by
      # [MaxNumberOfDomains](#MaxNumberOfDomains). A [NextToken](#NextToken)
      # is returned if there are more than `MaxNumberOfDomains` domains.
      # Calling `ListDomains` successive times with the `NextToken` provided
      # by the operation returns up to `MaxNumberOfDomains` more domain names
      # with each successive operation call.
      # @option params [Integer] :max_number_of_domains
      #   The maximum number of domain names you want returned. The range is 1
      #   to 100. The default setting is 100.
      # @option params [String] :next_token
      #   A string informing Amazon SimpleDB where to start the next list of
      #   domain names.
      # @return [Types::ListDomainsResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ListDomainsResult#domain_names #DomainNames} => Array&lt;String&gt;
      #   * {Types::ListDomainsResult#next_token #NextToken} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.list_domains({
      #     max_number_of_domains: 1,
      #     next_token: "String",
      #   })
      #
      # @example Response structure
      #   resp.domain_names #=> Array
      #   resp.domain_names[0] #=> String
      #   resp.next_token #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def list_domains(params = {}, options = {})
        req = build_request(:list_domains, params)
        req.send_request(options)
      end

      # The PutAttributes operation creates or replaces attributes in an item.
      # The client may specify new attributes using a combination of the
      # `Attribute.X.Name` and `Attribute.X.Value` parameters. The client
      # specifies the first attribute by the parameters `Attribute.0.Name` and
      # `Attribute.0.Value`, the second attribute by the parameters
      # `Attribute.1.Name` and `Attribute.1.Value`, and so on.
      #
      # Attributes are uniquely identified in an item by their name/value
      # combination. For example, a single item can have the attributes `\{
      # "first_name", "first_value" \}` and `\{ "first_name", second_value"
      # \}`. However, it cannot have two attribute instances where both the
      # `Attribute.X.Name` and `Attribute.X.Value` are the same.
      #
      # Optionally, the requestor can supply the `Replace` parameter for each
      # individual attribute. Setting this value to `true` causes the new
      # attribute value to replace the existing attribute value(s). For
      # example, if an item has the attributes `\{ 'a', '1' \}`, `\{ 'b',
      # '2'\}` and `\{ 'b', '3' \}` and the requestor calls `PutAttributes`
      # using the attributes `\{ 'b', '4' \}` with the `Replace` parameter set
      # to true, the final attributes of the item are changed to `\{ 'a', '1'
      # \}` and `\{ 'b', '4' \}`, which replaces the previous values of the
      # \'b\' attribute with the new value.
      #
      # You cannot specify an empty string as an attribute name.
      #
      # Because Amazon SimpleDB makes multiple copies of client data and uses
      # an eventual consistency update model, an immediate GetAttributes or
      # Select operation (read) immediately after a PutAttributes or
      # DeleteAttributes operation (write) might not return the updated data.
      #
      # The following limitations are enforced for this operation: * 256 total
      # attribute name-value pairs per item
      # * One billion attributes per domain
      # * 10 GB of total user data storage per domain
      # @option params [required, String] :domain_name
      #   The name of the domain in which to perform the operation.
      # @option params [required, String] :item_name
      #   The name of the item.
      # @option params [required, Array<Types::ReplaceableAttribute>] :attributes
      #   The list of attributes.
      # @option params [Types::UpdateCondition] :expected
      #   The update condition which, if specified, determines whether the
      #   specified attributes will be updated or not. The update condition must
      #   be satisfied in order for this request to be processed and the
      #   attributes to be updated.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.put_attributes({
      #     domain_name: "String", # required
      #     item_name: "String", # required
      #     attributes: [ # required
      #       {
      #         name: "String", # required
      #         value: "String", # required
      #         replace: false,
      #       },
      #     ],
      #     expected: {
      #       name: "String",
      #       value: "String",
      #       exists: false,
      #     },
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def put_attributes(params = {}, options = {})
        req = build_request(:put_attributes, params)
        req.send_request(options)
      end

      # The `Select` operation returns a set of attributes for `ItemNames`
      # that match the select expression. `Select` is similar to the standard
      # SQL SELECT statement.
      #
      # The total size of the response cannot exceed 1 MB in total size.
      # Amazon SimpleDB automatically adjusts the number of items returned per
      # page to enforce this limit. For example, if the client asks to
      # retrieve 2500 items, but each individual item is 10 kB in size, the
      # system returns 100 items and an appropriate `NextToken` so the client
      # can access the next page of results.
      #
      # For information on how to construct select expressions, see Using
      # Select to Create Amazon SimpleDB Queries in the Developer Guide.
      # @option params [required, String] :select_expression
      #   The expression used to query the domain.
      # @option params [String] :next_token
      #   A string informing Amazon SimpleDB where to start the next list of `ItemNames`.
      # @option params [Boolean] :consistent_read
      #   Determines whether or not strong consistency should be enforced when data is read from SimpleDB. If `true`, any data previously written to SimpleDB will be returned. Otherwise, results will be consistent eventually, and the client may not see data that was written immediately before your read.
      # @return [Types::SelectResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::SelectResult#items #Items} => Array&lt;Types::Item&gt;
      #   * {Types::SelectResult#next_token #NextToken} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.select({
      #     select_expression: "String", # required
      #     next_token: "String",
      #     consistent_read: false,
      #   })
      #
      # @example Response structure
      #   resp.items #=> Array
      #   resp.items[0].name #=> String
      #   resp.items[0].alternate_name_encoding #=> String
      #   resp.items[0].attributes #=> Array
      #   resp.items[0].attributes[0].name #=> String
      #   resp.items[0].attributes[0].alternate_name_encoding #=> String
      #   resp.items[0].attributes[0].value #=> String
      #   resp.items[0].attributes[0].alternate_value_encoding #=> String
      #   resp.next_token #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def select(params = {}, options = {})
        req = build_request(:select, params)
        req.send_request(options)
      end

      # @!endgroup

      # @param [Symbol] waiter_name
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      # @option options [Integer] :max_attempts
      # @option options [Integer] :delay
      # @option options [Proc] :before_attempt
      # @option options [Proc] :before_wait
      def wait_until(waiter_name, params = {}, options = {})
        w = waiter(waiter_name, options)
        yield(w.waiter) if block_given? # deprecated
        w.wait(params)
      end

      def waiter_names
        waiters.keys
      end

      private

      # @param [Symbol] waiter_name
      # @param [Hash] options ({})
      def waiter(waiter_name, options = {})
        waiter_class = waiters[waiter_name]
        if waiter_class
          waiter_class.new(options.merge(client: self))
        else
          raise Aws::Waiters::Errors::NoSuchWaiterError.new(waiter_name, waiters.keys)
        end
      end

      def waiters
        {}
      end

      # @api private
      class << self

        attr_reader :identifier

        def errors_module
          Errors
        end

      end
    end
  end
end