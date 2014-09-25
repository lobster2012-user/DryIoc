﻿using DryIoc.MefAttributedModel.UnitTests.CUT;
using NUnit.Framework;

namespace DryIoc.MefAttributedModel.UnitTests
{
    [TestFixture]
    public class ImportExternalTests
    {
        [Test]
        public void I_can_export_ctor_param_service_on_resolve()
        {
            var container = new Container().WithAttributedModel();
            container.RegisterExports(typeof(NativeUser));

            var user = container.Resolve<NativeUser>();

            Assert.That(user.Tool, Is.Not.Null);
        }

        [Test]
        public void I_can_specify_Reuse_for_export_ctor_param_service_on_resolve()
        {
            var container = new Container().WithAttributedModel();
            container.RegisterExports(typeof(NativeUser));

            var one = container.Resolve<NativeUser>();
            var another = container.Resolve<NativeUser>();

            Assert.That(one.Tool, Is.Not.SameAs(another.Tool));
        }

        [Test]
        public void I_can_specify_constructor_while_exporting_once_a_ctor_param_service()
        {
            var container = new Container().WithAttributedModel();
            container.RegisterExports(typeof(HomeUser));

            var user = container.Resolve<HomeUser>();

            Assert.That(user.Tool.Message, Is.EqualTo("blah"));
        }

        [Test]
        public void I_can_specify_metadata()
        {
            var container = new Container().WithAttributedModel();
            container.RegisterExports(typeof(MyCode));

            var code = container.Resolve<MyCode>();

            Assert.That(code.Tool, Is.Not.Null);
            Assert.That(code.ToolMeta, Is.EqualTo(MineMeta.Green));
        }

        [Test]
        public void I_can_import_or_export_fields_and_properties_as_well()
        {
            var container = new Container().WithAttributedModel();
            container.RegisterExports(typeof(ServiceWithFieldAndProperty));

            var service = container.Resolve<ServiceWithFieldAndProperty>();

            Assert.That(service.Field, Is.InstanceOf<AnotherService>());
            Assert.That(service.Property, Is.InstanceOf<AnotherService>());
        }

        [Test]
        public void When_non_Import_attribute_used_It_should_throw()
        {
            var container = new Container().WithAttributedModel();
            container.RegisterExports(typeof(WithUnregisteredExternalEdependency));

            Assert.Throws<ContainerException>(() => 
                container.Resolve<WithUnregisteredExternalEdependency>());
        }

        [Test]
        public void Can_use_arbitrary_contract_key_type_for_ExportOnce_same_as_for_Export()
        {
            var container = new Container().WithAttributedModel();
            container.RegisterExports(typeof(OneDependsOnExternalTool), typeof(OtherDependsOnExternalTool));

            var one = container.Resolve<OneDependsOnExternalTool>();
            var other = container.Resolve<OtherDependsOnExternalTool>();

            Assert.That(one.Tool, Is.InstanceOf<ExternalTool>().And.SameAs(other.Tool));
        }
    }
}